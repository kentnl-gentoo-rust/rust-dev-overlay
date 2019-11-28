# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A lightweight logging facade for Rust"
HOMEPAGE="https://github.com/rust-lang/log"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde sval test"
F_SERDE="
	=dev-rust/serde-1*:=
"
F_SVAL="
	( =dev-rust/sval-0.4*:= >=dev-rust/sval-0.4.2 )
"

BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.2 )
	sval? ( ${F_SVAL} )
	serde? ( ${F_SERDE} )
	test? (
		${F_SVAL}
		${F_SERDE}
		=dev-rust/serde_test-1*:=
	)
"
