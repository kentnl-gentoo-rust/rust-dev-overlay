# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Test harness for ui tests of compiler diagnostics"
HOMEPAGE="https://github.com/dtolnay/trybuild"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	=dev-rust/glob-0.3*:=
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.3.0 )
	=dev-rust/serde-1*:=[derive]
	=dev-rust/serde_json-1*:=
	=dev-rust/termcolor-1*:=
	=dev-rust/toml-0.5*:=
"
