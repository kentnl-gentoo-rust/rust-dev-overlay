# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Minimal Adler32 implementation"
HOMEPAGE="https://github.com/remram44/adler32-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ZLIB"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/rand-0.4*:=
	)
"
