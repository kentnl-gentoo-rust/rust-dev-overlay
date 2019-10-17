# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Regular expressions for rust with finite automata and linear-time matching"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+perf-literal"
RESTRICT="test"

F_PERF_CACHE="( =dev-rust/thread_local-0.3*:= >=dev-rust/thread_local-0.3.6 )"
F_PERF_LITERAL="
	( =dev-rust/aho-corasick-0.7*:= >=dev-rust/aho-corasick-0.7.6 )
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2.1 )
"
F_PERF="
	${F_PERF_CACHE}
	${F_PERF_LITERAL}
"
F_UNICODE="
	( =dev-rust/regex-syntax-0.6*:= >=dev-rust/regex-syntax-0.6.12 )
"
BDEPEND="
	( =dev-rust/regex-syntax-0.6*:= >=dev-rust/regex-syntax-0.6.12 )
	perf-literal? ( $F_PERF_LITERAL )
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
