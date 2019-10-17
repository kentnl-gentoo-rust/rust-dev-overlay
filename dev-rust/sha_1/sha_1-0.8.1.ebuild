# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
ECRATE_NAME="sha-1"
DESCRIPTION="SHA-1 hash function"
HOMEPAGE="https://github.com/RustCrypto/hashes"
SRC_URI="https://crates.io/api/v1/crates/${ECRATE_NAME}/${PV}/download -> ${ECRATE_NAME}-${PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
F_ASM="
	=dev-rust/sha1-asm-0.4*:=
"
BDEPEND="
	=dev-rust/block-buffer-0.7*:=
	=dev-rust/digest-0.8*:=
	=dev-rust/fake-simd-0.1*:=
	=dev-rust/opaque-debug-0.2*:=
"

S="${WORKDIR}/${ECRATE_NAME}-${PV}"
src_prepare() {
	# Forces all optional deps
	rm -vrf examples/ || die
	default
}
src_install() {
	rust-crate_install "${ECRATE_NAME}" "${PV}"
}
