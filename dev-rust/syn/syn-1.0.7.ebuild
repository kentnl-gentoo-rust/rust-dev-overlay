# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Parser for Rust source code"
HOMEPAGE="https://github.com/dtolnay/syn"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test +printing +proc-macro"

F_QUOTE="
	=dev-rust/quote-1*:=
"
F_PRINTING="${F_QUOTE}"
F_PROC_MACRO="${F_QUOTE}"

BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/unicode-xid-0.2*:=
	printing? ( ${F_PRINTING} )
	proc-macro? ( ${F_PROC_MACRO} )
	test? (
		${F_QUOTE}
		=dev-rust/insta-0.11*:=
		=dev-rust/rayon-1*:=
		=dev-rust/ref-cast-0.2*:=
		=dev-rust/regex-1*:=
		=dev-rust/termcolor-1*:=
		( =dev-rust/walkdir-2*:= >=dev-rust/walkdir-2.1 )
	)
"

src_test() {
	ecargo test --release --all-features
}
