# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An HTTP/2.0 client and server"
HOMEPAGE="https://github.com/hyperium/h2"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/env_logger-0.5*:= >=dev-rust/env_logger-0.5.3 )
	=dev-rust/hex-0.2*:=
	( =dev-rust/quickcheck-0.4*:= >=dev-rust/quickcheck-0.4.1 )
	( =dev-rust/rand-0.3*:= >=dev-rust/rand-0.3.15 )
	=dev-rust/rustls-0.16*:=[logging]
	=dev-rust/serde-1*:=
	=dev-rust/serde_json-1*:=
	=dev-rust/tokio-0.2*:=[macros,tcp]
	=dev-rust/tokio-rustls-0.12*:=
	=dev-rust/walkdir-1*:=
	=dev-rust/webpki-0.21*:=
	=dev-rust/webpki-roots-0.17*:=
"
BDEPEND="
	( =dev-rust/bytes-0.5*:= >=dev-rust/bytes-0.5.2 )
	( =dev-rust/fnv-1*:= >=dev-rust/fnv-1.0.5 )
	=dev-rust/futures-core-0.3*:=
	=dev-rust/futures-sink-0.3*:=
	=dev-rust/futures-util-0.3*:=
	=dev-rust/http-0.2*:=
	=dev-rust/indexmap-1*:=
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.1 )
	=dev-rust/slab-0.4*:=
	=dev-rust/tokio-0.2*:=[io-util,sync]
	=dev-rust/tokio-util-0.2*:=
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-fixtures.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
