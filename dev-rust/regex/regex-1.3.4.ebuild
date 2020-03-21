# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Regular expressions for rust with finite automata and linear-time matching"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+perf-literal +perf-cache test"

F_PERF_CACHE="=dev-rust/thread_local-1*:="
F_PERF_LITERAL="
	( =dev-rust/aho-corasick-0.7*:= >=dev-rust/aho-corasick-0.7.6 )
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2.1 )
"
F_PERF="
	${F_PERF_CACHE}
	${F_PERF_LITERAL}
"
F_UNICODE="
	( =dev-rust/regex-syntax-0.6*:= >=dev-rust/regex-syntax-0.6.14 )
"
BDEPEND="
	( =dev-rust/regex-syntax-0.6*:= >=dev-rust/regex-syntax-0.6.12 )
	perf-literal? ( $F_PERF_LITERAL )
	perf-cache? ( ${F_PERF_CACHE} )
	test? (
		${F_PERF_CACHE}
		${F_PERF_LITERAL}
		${F_UNICODE}
		=dev-rust/doc-comment-0.3*:=
		=dev-rust/lazy_static-1*:=
		=dev-rust/quickcheck-0.8*:=
		=dev-rust/rand-0.6.5*:=
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}

src_test() {
	local targets=(
		''
		'aho-corasick'
		'memchr'
		'thread_local'

		'default'
		# nightly
		# 'pattern'
		'perf'
		'perf-cache'
		'perf-dfa'
		'perf-inline'
		'perf-literal'
		'unicode'
		'unicode-age'
		'unicode-bool'
		'unicode-case'
		'unicode-gencat'
		'unicode-perl'
		'unicode-script'
		'unicode-segment'
		# nightly
		# 'unstable'
		'use_std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features 'std ${i}'"
		# Avoid premature OOD
		CARGO_INCREMENTAL=0 ecargo test --no-default-features --features "std ${i}"
	done
	einfo "Testing (synthetic) --all-features"
	# Avoid premature OOD
	CARGO_INCREMENTAL=0 ecargo test --no-default-features --features "std ${targets[*]}"
}
