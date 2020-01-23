# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rust implementation of DEFLATE algorithm and related formats (ZLIB, GZIP)"
HOMEPAGE="https://github.com/sile/libflate"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/adler32-1*:=
	=dev-rust/crc32fast-1*:=
	=dev-rust/rle-decode-fast-1*:=
	( =dev-rust/take_mut-0.2*:= >=dev-rust/take_mut-0.2.2 )
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
