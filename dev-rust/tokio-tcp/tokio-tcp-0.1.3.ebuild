# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="TCP bindings for tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPENDS="
	=dev-rust/env_logger-0.5*:=
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.13 )
"
BDEPEND="
	=dev-rust/bytes-0.4*:=
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	=dev-rust/iovec-0.1*:=
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.14 )
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.6 )
	( =dev-rust/tokio-reactor-0.1*:= >=dev-rust/tokio-reactor-0.1.1 )
	test? ( ${DEV_DEPENDS} )
"
PATCHES=(
	"${FILESDIR}/${P}-bad-test.patch"
)
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
