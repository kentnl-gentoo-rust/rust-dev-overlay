# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Event loop that drives Tokio I/O resources"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	=dev-rust/crossbeam-utils-0.7*:=[std]
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.0.2 )
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.1 )
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.14 )
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.8.0 )
	=dev-rust/parking_lot-0.9*:=
	=dev-rust/slab-0.4*:=
	( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.1 )
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.6 )
	( =dev-rust/tokio-sync-0.1*:= >=dev-rust/tokio-sync-0.1.1 )
"
PATCHES=(
	"${FILESDIR}/${PN}-0.1.11-no-bench.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
