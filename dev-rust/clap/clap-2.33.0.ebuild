# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A Command Line Argument Parser"
HOMEPAGE="https://github.com/clap-rs/clap"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+color +suggestions test +vec-map wrap-help yaml"

F_COLOR="
	=dev-rust/ansi_term-0.11*:=
	( =dev-rust/atty-0.2*:= >=dev-rust/atty-0.2.2 )
"
F_SUGGESTIONS="
	=dev-rust/strsim-0.8*:=
"
F_VEC_MAP="
	=dev-rust/vec_map-0.8*:=
"
F_WRAP_HELP="
	=dev-rust/term_size-0.3*:=
	=dev-rust/textwrap-0.11*:=[term-size]
"
F_YAML="
	( =dev-rust/yaml-rust-0.3*:= >=dev-rust/yaml-rust-0.3.5 )
"
BDEPEND="
	=dev-rust/bitflags-1*:=
	=dev-rust/textwrap-0.11*:=
	( =dev-rust/unicode-width-0.1*:= >=dev-rust/unicode-width-0.1.4 )
	color? ( ${F_COLOR} )
	suggestions? ( ${F_SUGGESTIONS} )
	vec-map? ( ${F_VEC_MAP} )
	wrap-help? ( ${F_WRAP_HELP} )
	yaml? ( ${F_YAML} )
	test? (
		=dev-rust/regex-1*:=[perf-literal,perf-cache]
		${F_COLOR}
		${F_SUGGESTIONS}
		${F_VEC_MAP}
		${F_WRAP_HELP}
		${F_YAML}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unused-dev-deps.patch"
	"${FILESDIR}/${P}-no-clippy.patch"
)
