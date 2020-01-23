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
	=dev-rust/quote-1*:=
"
F_PRINTING="${F_QUOTE}"
F_PROC_MACRO="${F_QUOTE}"

DEV_DEPEND="
	=dev-rust/anyhow-1*:=
	=dev-rust/flate2-1*:=[rust-backend]
	=dev-rust/insta-0.12*:=
	=dev-rust/rayon-1*:=
	=dev-rust/ref-cast-1*:=
	=dev-rust/regex-1*:=[perf-literal,perf-cache]
	=dev-rust/reqwest-0.10*:=[blocking,default-tls]
	=dev-rust/tar-0.4*:=[xattr]
	=dev-rust/termcolor-1*:=
	( =dev-rust/walkdir-2*:= >=dev-rust/walkdir-2.1 )
"
BDEPEND="
	( =dev-rust/proc-macro2-1*:= >=dev-rust/proc-macro2-1.0.7 )
	=dev-rust/unicode-xid-0.2*:=
	printing? ( ${F_PRINTING} )
	proc-macro? ( ${F_PROC_MACRO} )
	test? (
		${F_QUOTE}
		${DEV_DEPEND}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-nobench.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
src_test() {
	ecargo test --all-features
}
