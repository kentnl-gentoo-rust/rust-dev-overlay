# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="An embeddedable brotli compressor/decompressor with optional stdlib support"
HOMEPAGE="https://github.com/dropbox/rust-brotli"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( BSD MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="bin +std validation"
F_STD="
	=dev-rust/alloc-stdlib-0.2*:=
	=dev-rust/brotli-decompressor-2.3*:=[std]
"
F_VALIDATION="
	=dev-rust/sha2-0.8*:=
"
BDEPEND="
	=dev-rust/alloc-no-stdlib-2*:=
	=dev-rust/brotli-decompressor-2.3*:=
	bin? ( ${F_STD} ${F_VALIDATION} )
	std? ( ${F_STD} )
	validation? ( ${F_VALIDATION} )
	test? (
		${F_STD}
		${F_VALIDATION}
	)
"
src_prepare() {
	rm -vrf benches/ examples/ ci/ \
		corrosion/ research/ uncorrode.py \
		appveyor.yml rustfmt.toml || die

	eapply \
		"${FILESDIR}/${P}-no-simd.patch" \
		"${FILESDIR}/${P}-no-benchmark.patch"

	if ! use bin; then
		eapply 	"${FILESDIR}/${P}-no-bin.patch"
		rm -vrf src/bin || die
	fi
	default
}
src_compile() {
	rust-crate_src_compile
	if use bin; then
		PATH="${PATH}:${WORKDIR}/bin" ecargo install --debug --path . --bins --root "${WORKDIR}"
	fi
}
src_install() {
	rust-crate_src_install
	if use bin; then
		exeinto "/usr/lib/rust/binaries/${P}"
		for bin in "brotli" "catbrotli"; do
			doexe "${WORKDIR}/bin/${bin}"
		done
	fi
}
crate_symlinks() {
	use bin || return 0
	(
		shopt -s extglob
		alternatives_auto_makesym "/usr/bin/rust-brotli" \
				"/usr/lib/rust/binaries/${PN}-+([0-9]).+([0-9]).+([0-9])/brotli"
		alternatives_auto_makesym "/usr/bin/catbrotli" \
				"/usr/lib/rust/binaries/${PN}-+([0-9]).+([0-9]).+([0-9])/catbrotli"
	)
}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
src_test() {
	local targets=(
		''
		'alloc-stdlib'
		'default'
		'disable-timer'
		'external-literal-probability'
		'pass-through-ffi-panics'
		'sha2'
		'std'
		'validation'
		'vector_scratch_space'
	)
	if ! use bin; then
		# https://github.com/dropbox/rust-brotli/issues/45
		targets+=( 'seccomp' )
	fi
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"
}
