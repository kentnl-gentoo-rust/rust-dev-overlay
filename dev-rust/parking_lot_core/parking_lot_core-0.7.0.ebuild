# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="And advanced API for creating custom sync primitives"
HOMEPAGE="https://github.com/Amanieu/parking_lot"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="deadlock-detection test"

F_BACKTRACE="
	( =dev-rust/backtrace-0.3*:=[libbacktrace] >=dev-rust/backtrace-0.3.2 )
"
F_PETGRAPH="
	( =dev-rust/petgraph-0.4*:=[graphmap] >=dev-rust/petgraph-0.4.5 )
"
F_THREAD_ID="
	( =dev-rust/thread-id-3*:= >=dev-rust/thread-id-3.2.0 )
"
F_DEADLOCK_DETECTION="
	${F_PETGRAPH}
	${F_THREAD_ID}
	${F_BACKTRACE}
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.5 )
	=dev-rust/smallvec-1*:=
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.55 )
	deadlock-detection? ( ${F_DEADLOCK_DETECTION} )
	test? ( ${F_DEADLOCK_DETECTION} )
"
PATCHES=(
	"${FILESDIR}/${PN}-0.6.2-unix-cargo.patch"
)
src_test() {
	local targets=(
		''
		'backtrace'
		'deadlock_detection'
		'nightly'
		'petgraph'
		'thread-id'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
