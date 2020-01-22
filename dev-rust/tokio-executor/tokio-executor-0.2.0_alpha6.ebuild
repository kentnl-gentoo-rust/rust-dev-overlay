# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Future execution primitives"
HOMEPAGE="https://github.com/tokio-rs/tokio"
MY_ALPHA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-alpha.${MY_ALPHA##alpha}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="blocking current-thread tracing test"
F_LAZY_STATIC="
	=dev-rust/lazy_static-1*:=
"
F_TOKIO_SYNC="
	~dev-rust/tokio-sync-0.2.0_alpha6
"
F_TRACING="
	( =dev-rust/tracing-0.1*:=[std] >=dev-rust/tracing-0.1.5 )
"
F_BLOCKING="
	${F_TOKIO_SYNC}
	${F_LAZY_STATIC}
"
F_CURRENT_THREAD="
	( =dev-rust/crossbeam-channel-0.3*:= >=dev-rust/crossbeam-channel-0.3.8 )
"
F_THREADPOOL="
	${F_TOKIO_SYNC}
	=dev-rust/crossbeam-deque-0.7*:=
	=dev-rust/crossbeam-queue-0.1*:=
	( =dev-rust/crossbeam-utils-0.6*:=[std] >=dev-rust/crossbeam-utils-0.6.4 )
	~dev-rust/futures-core-preview-0.3.0_alpha19:=
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.2 )
	${F_LAZY_STATIC}
	( =dev-rust/slab-0.4*:= >=dev-rust/slab-0.4.1 )
"
BDEPEND="
	~dev-rust/futures-util-preview-0.3.0_alpha19:=[std,channel]
	blocking? ( ${F_BLOCKING} )
	current-thread? ( ${F_CURRENT_THREAD} )
	tracing? ( ${F_TRACING} )
	test? (
		${F_LAZY_STATIC}
		${F_TRACING}
		${F_BLOCKING}
		${F_CURRENT_THREAD}
		${F_THREADPOOL}
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-${MY_PV}-broken-tests.patch"
)
S="${WORKDIR}/${PN}-${MY_PV}"
src_test() {
	ecargo test --all-features
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
