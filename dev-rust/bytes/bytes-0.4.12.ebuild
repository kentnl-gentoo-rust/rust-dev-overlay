# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Types and traits for working with bytes"
HOMEPAGE="https://github.com/carllerche/bytes"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="either serde"

F_EITHER="
	( =dev-rust/either-1*:= >=dev-rust/either-1.5 )
"
F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.1.0 )
	=dev-rust/iovec-0.1*:=
	either? ( ${F_EITHER} )
	serde? ( ${F_SERDE} )
	test? (
		${F_EITHER}
		${F_SERDE}
		=dev-rust/serde_test-1*:=
	)
"
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
