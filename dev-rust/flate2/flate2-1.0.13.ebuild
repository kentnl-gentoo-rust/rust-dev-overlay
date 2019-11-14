# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="miniz DEFLATE bindings as Reader/Writer streams"
HOMEPAGE="https://github.com/alexcrichton/flate2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+rust-backend"

RESTRICT="test"

F_RUST_BACKEND="
	( =dev-rust/miniz_oxide-0.3*:= >=dev-rust/miniz_oxide-0.3.5 )
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:=  >=dev-rust/cfg-if-0.1.6    )
	( =dev-rust/crc32fast-1*:= >=dev-rust/crc32fast-1.2.0 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.25  )
	( =dev-rust/libc-0.2*:=    >=dev-rust/libc-0.2.65     )
	rust-backend? ( ${F_RUST_BACKEND} )
"
src_prepare() {
	# Pulls dev-deps and optional deps
	rm -vrf examples/ || die
	default
}
