# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Common code for xml5ever and html5ever"
HOMEPAGE="https://github.com/servo/html5ever"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/log-0.4*:=
	=dev-rust/phf-0.7*:=
	=dev-rust/string_cache-0.7*:=
	=dev-rust/tendril-0.4*:=
	( =dev-rust/phf_codegen-0.7*:= >=dev-rust/phf_codegen-0.7.3 )
	=dev-rust/serde-1*:=
	=dev-rust/serde_derive-1*:=
	=dev-rust/serde_json-1*:=
	=dev-rust/string_cache_codegen-0.4*:=
"
