# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An event-driven non-blocking I/O platform"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+codec experimental-tracing +fs +io +reactor +rt-full +sync +tcp test +timer +udp +uds"

F_BYTES="=dev-rust/bytes-0.4*:="
F_MIO="( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.14 )"
F_NUM_CPUS="( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.8.0 )"
F_T_CODEC="=dev-rust/tokio-codec-0.1*:="
F_T_CURRENT_THREAD="( =dev-rust/tokio-current-thread-0.1*:= >=dev-rust/tokio-current-thread-0.1.6 )"
F_T_EXECUTOR="( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.7 )"
F_T_FS="( =dev-rust/tokio-fs-0.1*:= >=dev-rust/tokio-fs-0.1.6 )"
F_T_IO="( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.6 )"
F_T_REACTOR="( =dev-rust/tokio-reactor-0.1*:= >=dev-rust/tokio-reactor-0.1.1 )"
F_T_SYNC="( =dev-rust/tokio-sync-0.1*:= >=dev-rust/tokio-sync-0.1.5 )"
F_T_TCP="=dev-rust/tokio-tcp-0.1*:="
F_T_THREADPOOL="( =dev-rust/tokio-threadpool-0.1*:= >=dev-rust/tokio-threadpool-0.1.14 )"
F_T_TIMER="( =dev-rust/tokio-timer-0.2*:= >=dev-rust/tokio-timer-0.2.8 )"
F_T_UDP="=dev-rust/tokio-udp-0.1*:="
F_T_UDS="( =dev-rust/tokio-uds-0.2*:= >=dev-rust/tokio-uds-0.2.1 )"
F_TRACING_CORE="=dev-rust/tracing-core-0.1*:="

F_IO="${F_BYTES} ${F_T_IO}"
F_REACTOR="${F_IO} ${F_MIO} ${F_T_REACTOR}"
F_TIMER="${F_T_TIMER}"

BDEPEND="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.20 )
	codec? ( ${F_IO} ${F_T_CODEC} )
	experimental-tracing? ( ${F_TRACING_CORE} )
	fs? ( ${F_T_FS} )
	io? ( ${F_IO} )
	reactor? ( ${F_REACTOR} )
	rt-full? (
		${F_NUM_CPUS} ${F_REACTOR} ${F_TIMER}
		${F_T_CURRENT_THREAD} ${F_T_EXECUTOR}
		${F_T_THREADPOOL}
	)
	sync? ( ${F_T_SYNC} )
	tcp? ( ${F_T_TCP} )
	timer? ( ${F_TIMER} )
	udp? ( ${F_T_UDP} )
	uds? ( ${F_T_UDS} )
	test? (
		${F_BYTES}
		${F_MIO}
		${F_NUM_CPUS}
		${F_T_CODEC}
		${F_T_CURRENT_THREAD}
		${F_T_EXECUTOR}
		${F_T_FS}
		${F_T_IO}
		${F_T_REACTOR}
		${F_T_SYNC}
		${F_T_TCP}
		${F_T_THREADPOOL}
		${F_T_TIMER}
		${F_T_UDP}
		${F_T_UDS}
		${F_TRACING_CORE}
		=dev-rust/env_logger-0.5*:=
		=dev-rust/libc-0.2*:=
		=dev-rust/num_cpus-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-prune-deps.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
