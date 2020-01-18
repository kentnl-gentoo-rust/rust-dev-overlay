# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An event-driven non-blocking I/O platform"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="full io-driver io-util macros net process rt-threaded signal stream sync tcp test time udp uds"
RESTRICT="test"

F_FNV="( =dev-rust/fnv-1*:= >=dev-rust/fnv-1.0.6 )"
F_FUTURES_CORE="=dev-rust/futures-core-0.3*:="
F_IOVEC="( =dev-rust/iovec-0.1*:= >=dev-rust/iovec-0.1.4 )"
F_LAZY_STATIC="( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.0.2 )"
F_LIBC="( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.42 )"
F_MEMCHR="( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2 )"
F_MIO="( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.20 )"
F_MIO_UDS="( =dev-rust/mio-uds-0.6*:= >=dev-rust/mio-uds-0.6.5 )"
F_NUM_CPUS="( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.8.0 )"
F_SIGNAL_HOOK_REGISTRY="( =dev-rust/signal-hook-registry-1*:= >=dev-rust/signal-hook-registry-1.1.1 )"
F_SLAB="( =dev-rust/slab-0.4*:= >=dev-rust/slab-0.4.1 )"
F_TOKIO_MACROS="( =dev-rust/tokio-macros-0.2*:= >=dev-rust/tokio-macros-0.2.3 )"

F_IO_UTIL="${F_MEMCHR}"
F_MACROS="${F_TOKIO_MACROS}"
F_IO_DRIVER="${F_MIO} ${F_LAZY_STATIC}"
F_TCP="${F_IO_DRIVER} ${F_IOVEC}"
F_UDP="${F_IO_DRIVER}"
F_UDS="${F_IO_DRIVER} ${F_MIO_UDS} ${F_LIBC}"
F_NET="${F_TCP} ${F_UDP} ${F_UDS}"
F_SIGNAL="${F_IO_DRIVER} ${F_LAZY_STATIC} ${F_LIBC} ${F_MIO_UDS} ${F_SIGNAL_HOOK_REGISTRY}"
F_PROCESS="${F_IO_DRIVER} ${F_LIBC} ${F_SIGNAL}"
F_RT_THREADED="${F_NUM_CPUS}"
F_STREAM="${F_FUTURES_CORE}"
F_SYNC="${F_FNV}"
F_TIME="${F_SLAB}"
F_FULL="${F_IO_DRIVER} ${F_IO_UTIL} ${F_MACROS} ${F_NET}
	${F_RT_THREADED} ${F_SIGNAL} ${F_STREAM} ${F_SYNC} ${F_TIME}"

DEV_DEPEND="
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	( =dev-rust/loom-0.2*:= >=dev-rust/loom-0.2.13 )
	( =dev-rust/proptest-0.9*:=[bit-set,fork,timeout] >=dev-rust/proptest-0.9.4 )
	( =dev-rust/tempfile-3*:= >=dev-rust/tempfile-3.1.0 )
	=dev-rust/tokio-test-0.2*:=
	${F_FNV} ${F_FUTURES_CORE} ${F_IOVEC}
	${F_LAZY_STATIC} ${F_LIBC} ${F_MEMCHR}
	${F_MIO} ${F_MIO_UDS} ${F_NUM_CPUS}
	${F_SIGNAL_HOOK_REGISTRY} ${F_SLAB}
	${F_TOKIO_MACROS}
"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	( =dev-rust/pin-project-lite-0.1*:= >=dev-rust/pin-project-lite-0.1.1 )
	full? ( ${F_FULL} )
	io-driver? ( ${F_IO_DRIVER} )
	io-util? ( ${F_IO_UTIL} )
	macros? ( ${F_TOKIO_MACROS} )
	net? ( ${F_NET} )
	process? ( ${F_PROCESS} )
	rt-threaded? ( ${F_RT_THREADED} )
	signal? ( ${F_SIGNAL} )
	stream? ( ${F_STREAM} )
	sync? ( ${F_SYNC} )
	tcp? ( ${F_TCP} )
	time? ( ${F_TIME} )
	udp? ( ${F_UDP} )
	uds? ( ${F_UDS} )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
