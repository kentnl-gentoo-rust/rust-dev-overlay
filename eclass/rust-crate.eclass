# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: rust-crate.eclass
# @MAINTAINER:
# rust@gentoo.org
# @AUTHOR:
# Georgy Yakovlev <gyakovlev@gentoo.org>
# The Chromium OS Authors <chromium-os-dev@chromium.org>
# @SUPPORTED_EAPIS: 7
# @BLURB: common functions and variables for dev-rust category ebuilds

if [[ -z ${_RUST_CRATE_ECLASS} ]]; then
_RUST_CRATE_ECLASS=1

case ${EAPI} in
	7) ;;
	*) die "EAPI=${EAPI:-0} is not supported" ;;
esac

# @ECLASS-VARIABLE: RUST_CRATE_EMPTY
# @PRE_INHERIT
# @DESCRIPTION:
# Indicates that this package is an empty crate for satisfying cargo's
# requirements but will not actually be used during compile time.  Used by
# dev-dependencies or crates like winapi.
: ${RUST_CRATE_EMPTY:=}

inherit toolchain-funcs

EXPORT_FUNCTIONS src_unpack src_compile src_configure src_install src_test

SLOT="${PV}/${PR}"
IUSE="test"

BDEPEND=">=virtual/rust-1.37.0:="

ECRATE_NAME="${PN}"
ECARGO_HOME="${WORKDIR}/cargo_home"
RUST_CRATE_REGISTRY_DIR="/usr/lib/rust/crates"
#CRATES.IO_URI="${CRATES.IO_URI_OVERRIDE:-https://crates.io/api/v1/crates}"

# @FUNCTION: ecargo
# @USAGE: <args to cargo>
# @DESCRIPTION:
# Call cargo with the specified command line options.
ecargo() {
	debug-print-function ${FUNCNAME} "${@}"

	# The cargo developers have decided to make it as painful as possible to
	# use cargo inside another build system.  So there is no way to tell
	# cargo to just not write this lock file.  Instead we have to bend over
	# backwards to accommodate cargo.
	addwrite Cargo.lock
	rm -f Cargo.lock

	cargo -v "${@}" || die

	# Now remove any Cargo.lock files that cargo pointlessly created.
	rm -f Cargo.lock
}

# @FUNCTION: rust-crate_install
# @USAGE: [crate name] [crate version]
# @DESCRIPTION:
# Publish a library crate to the local registry.  Should only be called from
# within a src_install() function.
rust-crate_install() {
	debug-print-function ${FUNCNAME} "${@}"

	local name="${1:-${PN}}"
	local version="${2:-${PV}}"

	# Unpack the crate we just created into the directory registry.
	local crate="${CARGO_TARGET_DIR}/package/${name}-${version}.crate"

	mkdir -p "${D}/${RUST_CRATE_REGISTRY_DIR}" || die
	pushd "${D}/${RUST_CRATE_REGISTRY_DIR}" > /dev/null || die
	tar xf "${crate}" || die

	# Calculate the sha256sum since cargo will want this later.
	local shasum
	shasum="$(sha256sum "${crate}" | cut -d ' ' -f 1)"
	local dir="${name}-${version}"
	local checksum="${T}/${name}-${version}-checksum.json"

	# Calculate the sha256 hashes of all the files in the crate.
	local file files=( )
	#local files=( $(find "${dir}" -type f) )
	while read -rd '' file; do
		files+=( "${file}" )
	done < <(find "${dir}" -type f -print0)

	[[ "${#files[@]}" == "0" ]] && die "Could not find crate files for ${name}"

	# Now start filling out the checksum file.
	printf '{\n\t"package": "%s",\n\t"files": {\n' "${shasum}" > "${checksum}"
	local idx=0
	local f
	for f in "${files[@]}"; do
		shasum="$(sha256sum "${f}" | cut -d ' ' -f 1)"
		printf '\t\t"%s": "%s"' "${f#${dir}/}" "${shasum}" >> "${checksum}"

		# The json parser is unnecessarily strict about not allowing
		# commas on the last line so we have to track this ourselves.
		idx="$((idx+1))"
		if [[ "${idx}" == "${#files[@]}" ]]; then
			printf '\n' >> "${checksum}"
		else
			printf ',\n' >> "${checksum}"
		fi
	done
	printf "\t}\n}\n" >> "${checksum}"
	popd > /dev/null || die

	insinto "${RUST_CRATE_REGISTRY_DIR}/${name}-${version}"
	newins "${checksum}" .cargo-checksum.json

	# We want the Cargo.toml.orig file to be world readable.
	fperms 0644 "${RUST_CRATE_REGISTRY_DIR}/${name}-${version}/Cargo.toml.orig"
}

rust-crate_src_configure() {
	debug-print-function ${FUNCNAME} "${@}"

	export CARGO_TARGET_DIR="${WORKDIR}"
	export CARGO_HOME="${ECARGO_HOME}"
	export HOST="${CBUILD}"
	export HOST_CC="$(tc-getBUILD_CC)"
	export TARGET="${CHOST}"
	export TARGET_CC="$(tc-getCC)"
	# https://github.com/rust-lang/pkg-config-rs/issues/41
	tc-is-cross-compiler && export PKG_CONFIG_ALLOW_CROSS=1

	# We want debug info even in release builds.
	local rustflags=(
		-Cdebuginfo=2
		-Copt-level=3
		-v
	)

	use test || rustflags+=( -Cpanic=abort )

	export RUSTFLAGS="${rustflags[*]}"
}

rust-crate_src_install() {
	debug-print-function ${FUNCNAME} "${@}"

	rust-crate_install
}

rust-crate_src_compile() {
	debug-print-function ${FUNCNAME} "${@}"

	# Create the .crate file and optionally do a test build
	ecargo package --allow-dirty --no-metadata --no-verify
}

rust-crate_src_prepare() {
	debug-print-function ${FUNCNAME} "${@}"

	eapply_user
}

rust-crate_src_test() {
	debug-print-function ${FUNCNAME} "${@}"

	ecargo test
}

rust-crate_src_unpack() {
	debug-print-function ${FUNCNAME} "${@}"

	local archive
	for archive in ${A}; do
		case "${archive}" in
			*.crate)
				ebegin "Unpacking ${archive}"
				ln -s "${DISTDIR}/${archive}" "${archive}.tar"
				unpack "./${archive}.tar"
				rm "${archive}.tar"
				eend $?
				;;
			*)
				unpack "${archive}"
				;;
		esac
	done
	if [[ "${RUST_CRATE_EMPTY}" == "1" ]]; then
		# Generate an empty Cargo.toml and src/lib.rs for this crate.
		mkdir -p "${S}/src"
		cat <<- EOF >> "${S}/Cargo.toml"
		[package]
		name = "${PN}"
		version = "${PV}"
		authors = ["Gentoo Authors"]

		[dependencies]
		EOF

		touch "${S}/src/lib.rs"
	fi
	# Set up the cargo config.
	mkdir -p "${ECARGO_HOME}"
	cat <<- EOF > "${ECARGO_HOME}/config"
	[source.gentoo]
	directory = "${SYSROOT}${RUST_CRATE_REGISTRY_DIR}"

	[source.crates-io]
	replace-with = "gentoo"
	local-registry = "/nonexistent"
	EOF
}

fi
