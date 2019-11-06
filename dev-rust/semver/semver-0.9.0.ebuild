# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Semantic version parsing and comparison"
HOMEPAGE="https://github.com/steveklabnik/semver"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="ci test"

F_CI="
	=dev-rust/serde-1*:=
"
BDEPEND="
	=dev-rust/semver-parser-0.7*:=
	ci? ( ${F_CI} )
	test? (
		${F_CI}
		=dev-rust/crates-index-0.5*:=
		=dev-rust/serde_json-1*:=
		=dev-rust/serde_derive-1*:=
		( =dev-rust/tempdir-0.3*:= >=dev-rust/tempdir-0.3.4 )
	)
"
src_test() {
	RUSTFLAGS="${RUSTFLASGS} --cap-lints warn" rust-crate_src_test
}
