# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Executors for async tasks based on 'futures'"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test thread-pool"

F_THREAD_POOL="
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.8.0 )
"
BDEPEND="
	( =dev-rust/futures-core-0.3*:= >=dev-rust/futures-core-0.3.1 )
	( =dev-rust/futures-task-0.3*:= >=dev-rust/futures-task-0.3.1 )
	( =dev-rust/futures-util-0.3*:=[std?] >=dev-rust/futures-util-0.3.1 )
	thread-pool? ( ${F_THREAD_POOL} )
	test? (
		${F_THREAD_POOL}
		=dev-rust/futures-util-0.3*:=[std]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_test() {
	# https://github.com/rust-lang/futures-rs/issues/1020
	ecargo test --tests
}
