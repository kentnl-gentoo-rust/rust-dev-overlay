# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="SHA-2 hash functions"
HOMEPAGE="https://github.com/RustCrypto/hashes"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="asm asm-aarch64 test"

F_ASM="
	=dev-rust/sha2-asm-0.5*:=
"
F_ASM_AARCH64="
	${F_ASM}
	=dev-rust/libc-0.2*:=
"
DEV_DEPEND="
	=dev-rust/digest-0.8*:=[dev]
	=dev-rust/hex-literal-0.1*:=
"
BDEPEND="
	=dev-rust/block-buffer-0.7*:=
	=dev-rust/digest-0.8*:=
	=dev-rust/fake-simd-0.1*:=
	=dev-rust/opaque-debug-0.2*:=
	asm? ( ${F_ASM} )
	asm-aarch64? ( ${F_ASM_AARCH64} )
	test? (
		${F_ASM}
		${F_ASM_AARCH64}
		${F_STD}
		${DEV_DEPEND}
	)
"
src_prepare() {
	rm -vrf benches/ examples/ || die
	default
}
src_test() {
	local targets=(
		''
		'asm'
		# AArch64 only
		# 'asm-aarch64'
		'default'
		'libc'
		'sha2-asm'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"
}
