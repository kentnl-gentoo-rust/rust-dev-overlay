# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Generic types implementing functionality of arrays"
HOMEPAGE="https://github.com/fizyk20/generic-array"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="serde test"
F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	( =dev-rust/typenum-1*:= >=dev-rust/typenum-1.10 )
	serde? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		=dev-rust/bincode-1*:=
		=dev-rust/serde_json-1*:=
	)
"
