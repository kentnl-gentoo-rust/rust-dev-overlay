# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A stdlib-free dynamic allocator"
HOMEPAGE="https://github.com/dropbox/rustc-alloc-no-stdlib"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-no-bin.patch"
)
src_prepare() {
	rm -vrf src/bin/ || die
	default
}
src_test() {
	local targets=(
		''
		'unsafe'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
