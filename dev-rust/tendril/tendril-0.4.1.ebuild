# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Compact buffer/string type for zero-copy parsing"
HOMEPAGE="https://github.com/servo/tendril"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="encoding encoding_rs test"
F_ENCODING="
	=dev-rust/encoding-0.2*:=
"
F_ENCODING_RS="
	( =dev-rust/encoding_rs-0.8*:= >=dev-rust/encoding_rs-0.8.12 )
"
BDEPEND="
	( =dev-rust/futf-0.1*:= >=dev-rust/futf-0.1.1 )
	=dev-rust/mac-0.1*:=
	=dev-rust/utf_8-0.7*:=
	=dev-rust/mac-0.1*:=
	encoding? ( ${F_ENCODING} )
	encoding_rs? ( ${F_ENCODING_RS} )
	test? (
		${F_ENCODING}
		${F_ENCODING_RS}
		=dev-rust/rand-0.4*:=[std]
	)
"
src_prepare() {
	rm -rvf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
