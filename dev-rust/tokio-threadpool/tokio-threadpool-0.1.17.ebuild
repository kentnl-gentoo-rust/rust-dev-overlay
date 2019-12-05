# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A task scheduler backed by a work-stealing thread pool"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	=dev-rust/crossbeam-deque-0.7*:=
	=dev-rust/crossbeam-queue-0.1*:=
	( =dev-rust/crossbeam-utils-0.6*:= >=dev-rust/crossbeam-utils-0.6.4 )
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	=dev-rust/lazy_static-1*:=
	=dev-rust/log-0.4*:=
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.2 )
	( =dev-rust/slab-0.4*:= >=dev-rust/slab-0.4.1 )
	( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.8 )
	test? (
		=dev-rust/env_logger-0.6*:=
		=dev-rust/rand-0.7*:=[std]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench-deps.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
