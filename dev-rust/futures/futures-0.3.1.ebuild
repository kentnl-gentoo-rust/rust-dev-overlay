# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Composable iterator-like futures and streams, with zero-allocation"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+async-await compat +executor io-compat read-initializer +std test thread-pool"

F_STD="
	=dev-rust/futures-util-0.3*:=[std,io,channel]
"
F_ASYNC_AWAIT="
	=dev-rust/futures-util-0.3*:=[async-await-macro]
"
F_COMPAT="
	${F_STD}
	=dev-rust/futures-util-0.3*:=[compat]
"
F_EXECUTOR="
	${F_STD}
	( =dev-rust/futures-executor-0.3*:=[std] >=dev-rust/futures-executor-0.3.1 )
"
F_IO_COMPAT="
	${F_COMPAT}
	=dev-rust/futures-util-0.3*:=[io-compat]
"
F_READ_INITIALIZER="
	=dev-rust/futures-util-0.3*:=[read-initializer]
"
F_THREAD_POOL="
	${F_EXECUTOR}
	=dev-rust/futures-executor-0.3*:=[thread-pool]
"
BDEPEND="
	( =dev-rust/futures-channel-0.3*:=[sink] >=dev-rust/futures-channel-0.3.1 )
	( =dev-rust/futures-core-0.3*:=          >=dev-rust/futures-core-0.3.1    )
	( =dev-rust/futures-io-0.3*:=            >=dev-rust/futures-io-0.3.1      )
	( =dev-rust/futures-sink-0.3*:=          >=dev-rust/futures-sink-0.3.1    )
	( =dev-rust/futures-task-0.3*:=          >=dev-rust/futures-task-0.3.1    )
	( =dev-rust/futures-util-0.3*:=          >=dev-rust/futures-util-0.3.1    )
	async-await? (      ${F_ASYNC_AWAIT}      )
	compat? (           ${F_COMPAT}           )
	executor? (         ${F_EXECUTOR}         )
	io-compat? (        ${F_IO_COMPAT}        )
	read-initializer? ( ${F_READ_INITIALIZER} )
	std? (              ${F_STD}              )
	thread-pool? (      ${F_THREAD_POOL}      )
	test? (
		( =dev-rust/assert_matches-1*:= >=dev-rust/assert_matches-1.3.0   )
		( =dev-rust/pin-utils-0.1*:=    >=dev-rust/pin-utils-0.1.0_alpha4 )
		( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds]
			>=dev-rust/tokio-0.1.11
		)
		${F_ASYNC_AWAIT}
		${F_COMPAT}
		${F_EXECUTOR}
		${F_IO_COMPAT}
		${F_READ_INITIALIZER}
		${F_STD}
		${F_THREAD_POOL}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_test() {
	# breaks without
	ecargo test --features "default executor thread-pool"
}
