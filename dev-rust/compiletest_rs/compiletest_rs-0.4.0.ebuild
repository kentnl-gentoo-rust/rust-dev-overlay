# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="The compiletest util from Rust as a standalone test harness"
HOMEPAGE="https://github.com/laumann/compiletest-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="tmp"
F_TMP="
	=dev-rust/tempfile-3*:=
"
BDEPEND="
	( =dev-rust/diff-0.1*:= >=dev-rust/diff-0.1.10 )
	=dev-rust/filetime-0.2*:=
	=dev-rust/getopts-0.2*:=
	=dev-rust/log-0.4*:=
	=dev-rust/regex-1*:=[perf-literal,perf-cache]
	( =dev-rust/rustfix-0.4*:= >=dev-rust/rustfix-0.4.1 )
	=dev-rust/serde-1*:=
	=dev-rust/serde_derive-1*:=
	=dev-rust/serde_json-1*:=
	tmp? ( ${F_TMP} )
	=dev-rust/tester-0.7*:=
	=dev-rust/libc-0.2*:=
	test? (
		${F_TMP}
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-0.3.26-unix-cargo.patch"
)
src_test() {
	local targets=(
		''
		'tempfile'
		# Nightly-only crate ...
		# 'rustc'
		'stable'
		'tmp'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"
}
