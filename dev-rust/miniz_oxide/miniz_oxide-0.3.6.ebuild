# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="miniz based DEFLATE compression/decompression"
HOMEPAGE="https://github.com/Frommi/miniz_oxide"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/adler32-1*:= >=dev-rust/adler32-1.0.4 )
"
