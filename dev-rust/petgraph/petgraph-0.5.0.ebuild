# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Graph data structure types and algorithms"
HOMEPAGE="https://github.com/petgraph/petgraph"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="all serde-1"
F_QUICKCHECK="
	=dev-rust/quickcheck-0.8*:=
"
F_SERDE_1="
	=dev-rust/serde-1.0*:=
	=dev-rust/serde_derive-1*:=
"
F_ALL="
	${F_QUICKCHECK}
"
BDEPEND="
	=dev-rust/fixedbitset-0.2*:=
	( =dev-rust/indexmap-1*:= >=dev-rust/indexmap-1.0.2 )
	all? ( ${F_ALL} )
	serde-1? ( ${F_SERDE_1} )
	test? (
		${F_ALL}
		${F_SERDE_1}
		=dev-rust/defmac-0.1*:=
		=dev-rust/itertools-0.8*:=
		( =dev-rust/odds-0.2*:= >=dev-rust/odds-0.2.19 )
		( =dev-rust/rand-0.5*:=[std] >=dev-rust/rand-0.5.5 )
	)
"

src_prepare() {
	rm -vrf benches/ \
		custom.css \
		graph-example.dot || die
	default
}
src_test() {
	local targets=(
		''
		'all'
		'default'
		'generate'
		'graphmap'
		'matrix_graph'
		# needs these too
		'quickcheck stable_graph graphmap'
		'serde'
		'serde-1'
		'serde_derive'
		'stable_graph'
		'unstable'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
