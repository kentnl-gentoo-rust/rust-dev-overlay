# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Graph data structure types and algorithms"
HOMEPAGE="https://github.com/bluss/petgraph"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+graphmap"
RESTRICT="test"
F_GRAPHMAP="
	=dev-rust/ordermap-0.3*:=
"

BDEPEND="
	( =dev-rust/fixedbitset-0.1*:= >=dev-rust/fixedbitset-0.1.4 )
	graphmap? ( ${F_GRAPHMAP} )
"
