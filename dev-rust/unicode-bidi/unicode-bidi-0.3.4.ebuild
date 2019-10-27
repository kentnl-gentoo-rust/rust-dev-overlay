# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Implementation of the Unicode Bidirectional Algorithm"
HOMEPAGE="https://github.com/servo/unicode-bidi"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="with-serde"
RESTRICT="test"

F_FLAME_IT="
	=dev-rust/flame-0.1*:=
	=dev-rust/flamer-0.1*:=
"
F_WITH_SERDE="
	( >=dev-rust/serde-0.8:=[derive] <dev-rust/serde-2 )
"
BDEPEND="
	=dev-rust/matches-0.1*:=
	with-serde? ( ${F_WITH_SERDE} )
"
