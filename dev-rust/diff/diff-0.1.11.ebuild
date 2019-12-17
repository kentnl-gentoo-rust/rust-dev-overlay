# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="LCS based slice and string diffing"
HOMEPAGE="https://github.com/utkarshkukreti/diff.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-notest.patch"
)
src_prepare() {
	rm -vrf tests/tests.rs || die
	rm -vrf examples/ || die
	rm -vrf benches/ || die
	default
}
