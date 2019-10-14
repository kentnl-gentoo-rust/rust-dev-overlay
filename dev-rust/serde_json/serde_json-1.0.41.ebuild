# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A JSON serialization file format"
HOMEPAGE="https://github.com/serde-rs/json"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"
BDEPEND="
	( =dev-rust/itoa-0.4*:= >=dev-rust/itoa-0.4.3 )
	=dev-rust/ryu-1*:=
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.60 )
"
