# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rust bindings for libclang"
HOMEPAGE="https://github.com/KyleMayes/clang-sys"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="runtime test"
F_RUNTIME="
	( =dev-rust/libloading-0.5*:= >=dev-rust/libloading-0.5.2 )
"
BDEPEND="
	=dev-rust/glob-0.3*:=
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.66 )
	runtime? ( ${F_RUNTIME} )
	test? ( ${F_RUNTIME} )
"
src_prepare() {
	rm -vrf ci clippy.toml appveyor.yml .travis.yml || die
	default
}
src_test() {
	local targets=(
		''
		'libloading'
		"clang_"{3_5,3_6,3_7,3_8,3_9,4_0,5_0,6_0,7_0,8_0,9_0}
		"gte_clang_"{3_6,3_7,3_8,3_9,5_0,7_0,8_0,9_0}
		# "gte_clang_"{4_0,6_0}
		'runtime'
		# Needs static rustc
		# 'static'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"
}
