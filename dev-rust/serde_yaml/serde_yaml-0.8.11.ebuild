# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="YAML support for serde"
HOMEPAGE="https://github.com/dtolnay/serde-yaml"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/dtoa-0.4*:=
	=dev-rust/linked-hash-map-0.5*:=
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.60 )
	=dev-rust/yaml-rust-0.4*:=
	test? (
		=dev-rust/serde_derive-1*:=
		=dev-rust/unindent-0.1*:=
	)
"
