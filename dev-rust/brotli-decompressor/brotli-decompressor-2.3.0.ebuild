# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Embeddable brotli decompressor with optional stdlib support"
HOMEPAGE="https://github.com/dropbox/rustc-brotli-decompressor"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( BSD MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"
F_STD="
	=dev-rust/alloc-stdlib-0.2*:=
"
BDEPEND="
	=dev-rust/alloc-no-stdlib-2.0*:=
	std? ( ${F_STD} )
	test? ( ${F_STD} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-bin.patch"
)
src_prepare() {
	rm -vrf examples/ rustfmt.toml || die
	rm -vrf src/bin/ || die
	default
}
src_test() {
	local targets=(
		''
		'alloc-stdlib'
		'benchmark'
		'default'
		'disable-timer'
		'pass-through-ffi-panics'
		'seccomp'
		'std'
		'unsafe'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
