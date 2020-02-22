# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Assembly implementation of SHA2 compression function"
HOMEPAGE="https://github.com/RustCrypto/asm-hashes"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/cc-1*:=
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
