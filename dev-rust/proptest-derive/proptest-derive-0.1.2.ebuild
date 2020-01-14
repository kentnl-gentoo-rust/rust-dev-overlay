# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Custom-derive for the Arbitrary trait of proptest"
HOMEPAGE="https://github.com/altsysrq/proptest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/proptest-0.9*:=[bit-set,fork,std,timeout] >=dev-rust/proptest-0.9.4 )
"
BDEPEND="
	=dev-rust/proc-macro2-0.4*:=
	=dev-rust/quote-0.6*:=
	( =dev-rust/syn-0.15*:=[printing,proc-macro] >=dev-rust/syn-0.15.17 )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench.patch"
	"${FILESDIR}/${P}-no-nightly.patch"
	"${FILESDIR}/${P}-no-compile-tests.patch"
)
src_prepare() {
	rm -vrf benches/ .travis.yml tests/compile-fail || die
	default
}
