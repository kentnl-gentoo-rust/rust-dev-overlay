# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Timer facilities for Tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPENDS="
	=dev-rust/rand-0.7*:=[std]
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.7 )
	=dev-rust/tokio-mock-task-0.1*:=
"
BDEPEND="
	=dev-rust/crossbeam-utils-0.7*:=[std]
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	( =dev-rust/slab-0.4*:= >=dev-rust/slab-0.4.1 )
	( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.1 )
	test? ( ${DEV_DEPENDS} )
"
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
