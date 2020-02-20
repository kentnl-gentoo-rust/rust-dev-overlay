# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for encoding and decoding frames"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	( =dev-rust/bytes-0.4*:= >=dev-rust/bytes-0.4.7 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.18 )
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.7 )
"
