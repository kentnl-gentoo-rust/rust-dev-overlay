# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Graph data structure types and algorithms"
HOMEPAGE="https://github.com/bluss/petgraph"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="all +graphmap serde-1"
F_GRAPHMAP="
	=dev-rust/ordermap-0.3*:=
"
F_QUICKCHECK="
	=dev-rust/quickcheck-0.4*:=
"
F_SERDE_1="
	=dev-rust/serde-1.0*:=
	=dev-rust/serde_derive-1*:=
"
F_ALL="
	${F_QUICKCHECK}
	${F_GRAPHMAP}
"
BDEPEND="
	( =dev-rust/fixedbitset-0.1*:= >=dev-rust/fixedbitset-0.1.4 )
	all? ( ${F_ALL} )
	graphmap? ( ${F_GRAPHMAP} )
	serde-1? ( ${F_SERDE_1} )
	test? (
		${F_ALL}
		${F_SERDE_1}
		=dev-rust/defmac-0.1*:=
		=dev-rust/itertools-0.7*:=
		( =dev-rust/odds-0.2*:= >=dev-rust/odds-0.2.19 )
		=dev-rust/rand-0.3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
