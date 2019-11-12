# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Regular expressions for rust with finite automata and linear-time matching"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
BDEPEND="
	( =dev-rust/aho-corasick-0.5*:= >=dev-rust/aho-corasick-0.5.3 )
	( =dev-rust/memchr-0.1*:=       >=dev-rust/memchr-0.1.9       )
	( =dev-rust/thread_local-0.2*:= >=dev-rust/thread_local-0.2.4 )
	( =dev-rust/regex-syntax-0.3*:= >=dev-rust/regex-syntax-0.3.8 )
	( =dev-rust/utf8-ranges-0.1*:=  >=dev-rust/utf8-ranges-0.1.3  )
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
