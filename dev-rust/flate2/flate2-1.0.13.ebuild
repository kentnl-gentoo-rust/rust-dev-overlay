# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="miniz DEFLATE bindings as Reader/Writer streams"
HOMEPAGE="https://github.com/alexcrichton/flate2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="miniz-sys tokio +rust-backend test zlib"

F_RUST_BACKEND="
	( =dev-rust/miniz_oxide-0.3*:= >=dev-rust/miniz_oxide-0.3.5 )
"
F_MINIZ_SYS="
	( =dev-rust/miniz-sys-0.1*:= >=dev-rust/miniz-sys-0.1.11 )
"
F_TOKIO="
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.11 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.25  )
"
F_ZLIB="
	( =dev-rust/libz-sys-1*:= >=dev-rust/libz-sys-1.0.25 )
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:=  >=dev-rust/cfg-if-0.1.6    )
	( =dev-rust/crc32fast-1*:= >=dev-rust/crc32fast-1.2.0 )
	( =dev-rust/libc-0.2*:=    >=dev-rust/libc-0.2.65     )
	rust-backend? ( ${F_RUST_BACKEND} )
	miniz-sys? ( ${F_MINIZ_SYS} )
	tokio? ( ${F_TOKIO} )
	zlib? ( ${F_ZLIB} )
	test? (
		${F_RUST_BACKEND}
		${F_MINIZ_SYS}
		${F_TOKIO}
		${F_ZLIB}
		=dev-rust/quickcheck-0.9*:=
		=dev-rust/rand-0.7*:=[std]
		( =dev-rust/tokio-tcp-0.1*:= >=dev-rust/tokio-tcp-0.1.3 )
		( =dev-rust/tokio-threadpool-0.1*:= >=dev-rust/tokio-threadpool-0.1.10 )
	)
"
src_prepare() {
	# Pulls dev-deps and optional deps
	# but a test uses examples/hello_world.txt
	rm -vrf examples/*.rs || die
	use test || rm -r examples/ || die
	default
}
