# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="The ChaCha family of stream ciphers"
HOMEPAGE="https://github.com/cryptocorrosion/cryptocorrosion"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+rustcrypto-api test"
F_RUSTCRYPTO_API="
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.3 )
	=dev-rust/stream-cipher-0.3*:=
"
BDEPEND="
	( =dev-rust/ppv-lite86-0.2*:= >=dev-rust/ppv-lite86-0.2.6 )
	rustcrypto-api? ( ${F_RUSTCRYPTO_API} )
	test? (
		${F_RUSTCRYPTO_API}
		=dev-rust/hex-literal-0.2*:=
	)
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
