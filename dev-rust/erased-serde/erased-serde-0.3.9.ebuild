# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Type-erased Serialize and Serializer traits"
HOMEPAGE="https://github.com/dtolnay/erased-serde"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.63 )
	test? (
		=dev-rust/serde_cbor-0.9*:=
		=dev-rust/serde_derive-1*:=
		=dev-rust/serde_json-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-stripped-test.patch"
)
