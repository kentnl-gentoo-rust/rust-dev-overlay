# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Synchronization utilites"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/loom-0.1*:=[futures] >=dev-rust/loom-0.1.1 )
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.15 )
	( =dev-rust/tokio-mock-task-0.1*:= >=dev-rust/tokio-0.1.1 )
"
BDEPEND="
	( =dev-rust/fnv-1*:= >=dev-rust/fnv-1.0.6 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${PN}-0.1.7-remove-unused-deps.patch"
	"${FILESDIR}/${PN}-0.1.7-no-smoke.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
