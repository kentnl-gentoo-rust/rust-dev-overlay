# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Hash Table with consistent order and fast iteration"
HOMEPAGE="https://github.com/bluss/indexmap"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="rayon serde"
RESTRICT="test"

F_RAYON="
	=dev-rust/rayon-1*:=
"
F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	rayon? ( ${F_RAYON} )
	serde? ( ${F_SERDE} )
	( =dev-rust/autocfg-0.1*:= >=dev-rust/autocfg-0.1.6 )
"
