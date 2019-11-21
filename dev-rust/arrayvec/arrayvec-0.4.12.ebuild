# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Array-backed, stack-storable, fixed capacity vector"
HOMEPAGE="https://github.com/bluss/arrayvec"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde-1 test"

F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	( =dev-rust/nodrop-0.1* >=dev-rust/nodrop-0.1.12 )
	serde-1? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		=dev-rust/matches-0.1*:=
		=dev-rust/serde_test-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-benchmarks.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
