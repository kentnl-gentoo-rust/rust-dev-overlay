# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Hypothesis-like property-based testing and shrinking"
HOMEPAGE="https://github.com/altsysrq/proptest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+bit-set +fork +std test +timeout"

F_BIT_SET="
	=dev-rust/bit-set-0.5*:=
"
F_LAZY_STATIC="
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.2 )
"
F_QUICK_ERROR="
	( =dev-rust/quick-error-1*:= >=dev-rust/quick-error-1.2.1 )
"
F_STD="
	=dev-rust/rand-0.6*:=[std]
	( =dev-rust/quick-error-1*:= >=dev-rust/quick-error-1.2.1 )
	=dev-rust/regex-syntax-0.6*:=
	${F_LAZY_STATIC}
"
F_FORK="
	${F_STD}
	( =dev-rust/rusty-fork-0.2*:= >=dev-rust/rusty-fork-0.2.1 )
	=dev-rust/tempfile-3*:=
"
F_TIMEOUT="
	${F_FORK}
	=dev-rust/rusty-fork-0.2*:=[timeout]
"
BDEPEND="
	( =dev-rust/bitflags-1*:= >=dev-rust/bitflags-1.0.1 )
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.2.3 )
	( =dev-rust/num-traits-0.2*:= >=dev-rust/num-traits-0.2.2 )
	=dev-rust/rand-0.6*:=
	=dev-rust/rand_chacha-0.1*:=
	=dev-rust/rand_xorshift-0.1*:=
	bit-set? ( ${F_BIT_SET} )
	fork? ( ${F_FORK} )
	std? ( ${F_STD} )
	timeout? ( ${F_TIMEOUT} )
	test? (
		=dev-rust/regex-1*:=[perf-literal,perf-cache]
		${F_TIMEOUT}
		${F_BIT_SET}
	)
"
src_prepare() {
	rm -vrf examples/ gen-readme.sh appveyor.yml .travis.yml || die
	default
}
src_test() {
	local targets=(
		# --all-features simulation
		'alloc atomic64bit bit-set break-dead-code default default-code-coverage fork lazy_static quick-error regex-syntax rusty-fork std tempfile timeout'
		# dependency 'rand' has features=alloc enabled
		# but without 'rand/std' rand will use nightly-only 'feature(alloc)'
		# therefor, 'rand/std' is required for all tests.
		# additionally, there appears to be some other messes in the crate where
		# 'std' is implicitly required: https://github.com/AltSysrq/proptest/issues/174
		'std alloc'
		'std atomic64bit'
		'std bit-set'
		'std break-dead-code'
		'std default'
		'std default-code-coverage'
		'std fork'
		'std lazy_static'
		'std quick-error'
		'std regex-syntax'
		'std rusty-fork'
		'std'
		'std tempfile'
		'std timeout'
		# unstable + std uses nightly-only 'feature(ip)'
		# 'std unstable'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
}
