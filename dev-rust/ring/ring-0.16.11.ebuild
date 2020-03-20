# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Safe, fast, small crypto using Rust"
HOMEPAGE="https://github.com/briansmith/ring"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ISC MIT openssl SSLeay"
KEYWORDS="~amd64 ~x86"
IUSE="+dev-urandom-fallback test"
F_LAZY_STATIC="
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.3 )
"
BDEPEND="
	=dev-rust/untrusted-0.7*:=
	( =dev-rust/cc-1*:= >=dev-rust/cc-1.0.37 )
	( =dev-rust/spin-0.5*:= >=dev-rust/spin-0.5.2 )
	dev-urandom-fallback? ( ${F_LAZY_STATIC} )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.48 )
	test? (
		${F_LAZY_STATIC}
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-0.16.9-unix-cargo.patch"
)

src_test() {
	local targets=(
		#  broken
		# ''
		'alloc lazy_static'

		'alloc'
		'default'
		'alloc dev_urandom_fallback'
		# broken, requires nightly feature(test)
		# 'internal_benches'
		'alloc slow_tests'
		'std'
		'alloc test_logging'

		'lazy_static alloc default dev_urandom_fallback slow_tests std test_logging'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
}
