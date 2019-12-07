# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core I/O and event loop primitives for async I/O"
HOMEPAGE="https://github.com/tokio-rs/tokio-core"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/bytes-0.4*:=
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.21 )
	=dev-rust/iovec-0.1*:=
	=dev-rust/log-0.4*:=
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.12 )
	=dev-rust/scoped-tls-0.1*:=
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.5 )
	( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.2 )
	=dev-rust/tokio-io-0.1*:=
	( =dev-rust/tokio-reactor-0.1*:= >=dev-rust/tokio-reactor-0.1.1 )
	( =dev-rust/tokio-timer-0.2*:= >=dev-rust/tokio-timer-0.2.1 )
	test? (
		=dev-rust/env_logger-0.4*:=
		=dev-rust/libc-0.2*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf benches/ examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
