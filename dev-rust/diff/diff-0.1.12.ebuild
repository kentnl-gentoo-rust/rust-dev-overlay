# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="LCS based slice and string diffing"
HOMEPAGE="https://github.com/utkarshkukreti/diff.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/quickcheck-0.9*:=[regex,use-logging]
	( =dev-rust/speculate-0.1*:= >=dev-rust/speculate-0.1.2 )
"
BDEPEND="
	test? ( ${DEV_DEPEND} )
"
src_prepare() {
	rm -vrf examples/ benches/ .travis.yml || die
	default
}
