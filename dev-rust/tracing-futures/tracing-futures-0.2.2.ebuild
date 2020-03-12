# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for instrumenting futures with tracing"
HOMEPAGE="https://github.com/tokio-rs/tracing"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="tokio tokio-executor futures-01 futures-03 +std-future +std test"
F_TOKIO="
	=dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds]
"
F_TOKIO_EXECUTOR="
	=dev-rust/tokio-executor-0.1*:=
"
F_FUTURES_01="
	=dev-rust/futures-0.1*:=
"
F_STD_FUTURE="
	=dev-rust/pin-project-0.4*:=
"
F_STD="
	=dev-rust/tracing-0.1*:=[std]
"
F_FUTURES_03="
	${F_STD_FUTURE}
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	=dev-rust/futures-task-0.3*:=
	${F_STD}
"
DEV_DEPEND="
	( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,tcp,timer,udp,uds] >=dev-rust/tokio-0.1.22 )
"
BDEPEND="
	=dev-rust/tracing-0.1*:=
	tokio? ( ${F_TOKIO} )
	tokio-executor? ( ${F_TOKIO_EXECUTOR} )
	futures-01? ( ${F_FUTURES_01} )
	futures-03? ( ${F_FUTURES_03} )
	std? ( ${F_STD} )
	std-future? ( ${F_STD_FUTURE} )
	test? (
		${DEV_DEPEND}
		${F_STD}
		${F_TOKIO}
		${F_TOKIO_EXECUTOR}
		${F_FUTURES_01}
		${F_FUTURES_03}
		${F_STD_FUTURE}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_test() {
	local targets=(
		''
		'futures'
		'futures-task'
		'futures_01'
		'pin-project'
		'tokio'
		'tokio-executor'
		'default'
		'futures-01'
		'futures-03'
		'std'
		'std-future'
		# tokio doesn't work with futures-01
		# https://github.com/tokio-rs/tracing/issues/632
		'tokio futures futures-task futures_01 pin-project tokio-executor default futures-03 std std-future'
		'futures-01 futures futures-task futures_01 pin-project tokio-executor default futures-03 std std-future'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
}
