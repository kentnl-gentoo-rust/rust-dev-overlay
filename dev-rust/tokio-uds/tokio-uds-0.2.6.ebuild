# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Unix Domain Sockets for Tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPEND="
	=dev-rust/tempfile-3.1*:=
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.6 )
"
BDEPEND="
	( =dev-rust/bytes-0.4*:= >=dev-rust/bytes-0.4.8 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.21 )
	( =dev-rust/iovec-0.1*:= >=dev-rust/iovec-0.1.2 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.42 )
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.2 )
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.14 )
	( =dev-rust/mio-uds-0.6*:= >=dev-rust/mio-uds-0.6.5 )
	=dev-rust/tokio-codec-0.1*:=
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.6 )
	( =dev-rust/tokio-reactor-0.1*:= >=dev-rust/tokio-reactor-0.1.1 )
	test? ( ${DEV_DEPEND} )
"
#src_test() {
#	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
#}
