# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Codegen  library for string_cache"
HOMEPAGE="https://github.com/servo/string-cache"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/phf_generator-0.7*:= >=dev-rust/phf_generator-0.7.15 )
	( =dev-rust/phf_shared-0.7*:= >=dev-rust/phf_shared-0.7.4 )
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/string_cache_shared-0.3*:=
"
