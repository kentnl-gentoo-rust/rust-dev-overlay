# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Half-precision f16 and bf16 types as per IEEE 754-2008"
HOMEPAGE="https://github.com/starkat99/half-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serialize test"
F_SERDE="
	=dev-rust/serde-1*:=[derive]
"
BDEPEND="
	serialize? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		=dev-rust/quickcheck-0.9*:=[regex,use-logging]
		=dev-rust/quickcheck_macros-0.8*:=
		=dev-rust/rand-0.7*:=[std]
		( =dev-rust/version-sync-0.8*:= >=dev-rust/version-sync-0.8.1 )
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-1.4.0-nobench.patch"
)
src_prepare() {
	rm -vrf benches/ appveyor.yml || die
	default
}
src_test() {
	local targets=(
		''
		'serde'
		'serialize'
		'std'
		# 'use-intrinsics' # nightly
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"
}
