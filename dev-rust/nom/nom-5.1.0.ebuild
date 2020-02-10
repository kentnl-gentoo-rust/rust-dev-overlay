# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A byte-oriented, zero-copy, parse combinators library"
HOMEPAGE="https://github.com/Geal/nom"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="lexical regexp regexp-macros test"
F_LEXICAL="
	=dev-rust/lexical-core-0.4*:=[correct,ryu]
"
F_REGEXP="
	=dev-rust/regex-1*:=[perf-cache,perf-literal]
"
F_REGEXP_MACROS="
	${F_REGEXP}
	=dev-rust/lazy_static-1*:=
"
DEV_DEPEND="
	=dev-rust/doc-comment-0.3*:=
"
BDEPEND="
	=dev-rust/memchr-2*:=
	=dev-rust/version_check-0.1*:=
	lexical? ( ${F_LEXICAL} )
	regexp? ( ${F_REGEXP} )
	regexp-macros? ( ${F_REGEXP_MACROS} )
	test? (
		${DEV_DEPEND}
		${F_LEXICAL}
		${F_REGEXP_MACROS}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench.patch"
)
src_test() {
	local targets=(
		''
		# alloc w/o std uses nightly feature(alloc)
		"std alloc"
		default
		lazy_static
		lexical
		lexical-core
		regex
		regexp
		regexp_macros
		std
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
