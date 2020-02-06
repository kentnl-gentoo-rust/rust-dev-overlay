# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Codegen library for string_cache"
HOMEPAGE="https://github.com/servo/string-cache"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/phf_generator-0.8*:=
	=dev-rust/phf_shared-0.8*:=
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
"
