# Copyright 2019-2020 Gentoo Authors
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
	=dev-rust/quote-0.6*:=
"
F_PRINTING="${F_QUOTE}"
F_PROC_MACRO="${F_QUOTE}"

BDEPEND="
	( =dev-rust/proc-macro2-0.4*:= >=dev-rust/proc-macro2-0.4.4 )
	=dev-rust/unicode-xid-0.1*:=
	printing? ( ${F_PRINTING} )
	proc-macro? ( ${F_PROC_MACRO} )
	test? (
		${F_QUOTE}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-cargo-cruft.patch"
	"${FILESDIR}/${P}-broken-test.patch"
)
src_test() {
	ecargo test --all-features
}
