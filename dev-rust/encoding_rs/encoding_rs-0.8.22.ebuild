# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A Gecko-oriented implementation of the Encoding Standard"
HOMEPAGE="https://github.com/hsivonen/encoding_rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde test"

F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	=dev-rust/cfg-if-0.1*:=
	serde? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		=dev-rust/bincode-1*:=
		=dev-rust/serde_derive-1*:=
		=dev-rust/serde_json-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
