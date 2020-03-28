# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Filesystem API for tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/rand-0.7*:=[std]
	=dev-rust/tempfile-3.1*:=
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.7 )
	=dev-rust/tokio-codec-0.1*:=
"
BDEPEND="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.21 )
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.6 )
	( =dev-rust/tokio-threadpool-0.1*:= >=dev-rust/tokio-threadpool-0.1.3 )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
