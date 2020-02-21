# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
ECRATE_NAME="sha-1"
DESCRIPTION="SHA-1 hash function"
HOMEPAGE="https://github.com/RustCrypto/hashes"
SRC_URI="https://crates.io/api/v1/crates/${ECRATE_NAME}/${PV}/download -> ${ECRATE_NAME}-${PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="asm asm-aarch64 test"
F_ASM="
	=dev-rust/sha1-asm-0.4*:=
"
F_ASM_AARCH64="
	${F_ASM}
	=dev-rust/libc-0.2*:=
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
		=dev-rust/digest-0.8*:=[dev]
		=dev-rust/hex-literal-0.1*:=
	)
"

S="${WORKDIR}/${ECRATE_NAME}-${PV}"
src_prepare() {
	# Forces all optional deps
	rm -vrf benches/ examples/ || die
	default
}
src_install() {
	rust-crate_install "${ECRATE_NAME}" "${PV}"
}
src_test() {
	local targets=(
		''
		'asm'
		# Only works on AArch64
		# 'asm-aarch64'
		'default'
		'libc'
		'sha1-asm'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"
}
