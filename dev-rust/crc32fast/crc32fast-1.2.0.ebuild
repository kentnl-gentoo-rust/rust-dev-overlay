# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Fast, SIMD-accelerated CRC32 (IEEE) checksum computation"
HOMEPAGE="https://github.com/srijs/rust-crc32fast"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"

BDEPEND="
	=dev-rust/cfg-if-0.1*:=
"
