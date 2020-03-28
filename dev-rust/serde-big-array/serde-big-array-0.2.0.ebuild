# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Big array helper for serde"
HOMEPAGE="https://github.com/est31/serde-big-array"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/serde_derive-1*:=
	=dev-rust/serde-1*:=
	test? (
		=dev-rust/serde_json-1*:=
	)
"
