# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Parser for Rust source code"
HOMEPAGE="https://github.com/dtolnay/syn"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test +printing +parsing"

F_QUOTE="
	( =dev-rust/quote-0.3*:= >=dev-rust/quote-0.3.7 )
"
F_UNICODE_XID="
	( =dev-rust/unicode-xid-0.0*:= >=dev-rust/unicode-xid-0.0.4 )
"
F_SYNOM="
	=dev-rust/synom-0.11*:=
"
F_PRINTING="${F_QUOTE}"
F_PARSING="
	${F_UNICODE_XID}
	${F_SYNOM}
"

BDEPEND="
	printing? ( ${F_PRINTING} )
	parsing? ( ${F_PARSING} )
	test? (
		${F_QUOTE}
		${F_UNICODE_XID}
		${F_SYNOM}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-cargo-path.patch"
)
