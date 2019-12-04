# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Regular expressions for rust with finite automata and linear-time matching"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/aho-corasick-0.6*:=
	=dev-rust/memchr-2*:=
	( =dev-rust/regex-syntax-0.5*:= >=dev-rust/regex-syntax-0.5.6 )
	( =dev-rust/thread_local-0.3*:= >=dev-rust/thread_local-0.3.2 )
	=dev-rust/utf8-ranges-1*:=
	test? (
		=dev-rust/lazy_static-1*:=
		=dev-rust/quickcheck-0.6*:=
		=dev-rust/rand-0.4*:=
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
