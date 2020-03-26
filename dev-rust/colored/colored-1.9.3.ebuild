# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="The most simple way to add colors in your terminal"
HOMEPAGE="https://github.com/mackwic/colored"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MPL-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/ansi_term-0.12*:=
	~dev-rust/rspec-1.0.0_beta3
"
BDEPEND="
	( =dev-rust/atty-0.2*:= >=dev-rust/atty-0.2.11 )
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.4.0 )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-no-color-tests.patch"
)
src_prepare() {
	rm -vrf examples/ Dockerfile || die
	default
}
src_test() {
	local targets=(
		''
		'no-color'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
