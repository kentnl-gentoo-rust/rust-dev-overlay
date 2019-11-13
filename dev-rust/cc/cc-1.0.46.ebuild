# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="Invoke a native C compiler for linking into Rust code"
HOMEPAGE="https://github.com/rust-lang-nursery/alex-crichton/cc-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="bin parallel test"
# https://github.com/alexcrichton/cc-rs/issues/444
RESTRICT="test"
F_PARALLEL="
	( =dev-rust/jobserver-0.1*:= >=dev-rust/jobserver-0.1.16 )
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.10 )
"
DEV_DEPENDS="
	=dev-rust/tempdir-0.3*:=
"
BDEPEND="
	bin? (
		${F_PARALLEL}
		${DEV_DEPENDS}
	)
	parallel? ( ${F_PARALLEL} )
	test? (
		${F_PARALLEL}
		${DEV_DEPENDS}
	)
"

src_prepare() {
	if ! use bin && ! use test; then
		# pulls in all opt-deps and dev-deps
		rm -vrf src/bin/ || die
	fi
	default
}
src_compile() {
	rust-crate_src_compile
	if use bin; then
		ecargo build --release --bins
	fi
}
src_install() {
	rust-crate_src_install
	if use bin; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/release/gcc-shim"
	fi
}
crate_symlinks() {
	use bin || return 0
	# Note: +( ) is a bash ext-glob feature
	# which allows "one-or-more-of" semantics of the included expressions.
	# and this is far superior to using
	#  {[0-9],[0-9][0-9],[0-9][0-9][0-9]}
	# or something equally horrible to match one, two, and 3 digit integers.

	local OLDOPTS
	OLDOPTS="$( shopt -p )"
	shopt -s extglob
	alternatives_auto_makesym "/usr/bin/gcc-shim" \
		"/usr/lib/rust/binaries/cc-+([0-9]).+([0-9]).+([0-9])/gcc-shim"
	shopt -u extglob
	eval "$OLDOPTS"
}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
