# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Misclenaeous collection extensions"
HOMEPAGE="https://github.com/bluss/odds"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	test? (
		( =dev-rust/itertools-0.5*:= >=dev-rust/itertools-0.5.1 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-nobench.patch"
	"${FILESDIR}/${P}-slice-tests.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
