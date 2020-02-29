# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Token De/Serializer for testing De/Serialize implementations"
HOMEPAGE="https://github.com/serde-rs/serde"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.60 )
	test? (
		=dev-rust/serde_derive-1*:=
	)
"
src_test() {
	# doctests broken: https://github.com/serde-rs/serde/issues/1744
	ecargo test --tests
}
