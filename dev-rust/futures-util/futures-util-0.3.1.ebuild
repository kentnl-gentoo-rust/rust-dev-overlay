# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Common utilities and extension traits for the 'futures' library"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+async-await-macro channel compat io-compat io read-initializer sink +std test"
F_STD="
	=dev-rust/slab-0.4*:=
"
F_ASYNC_AWAIT_MACRO="
	( =dev-rust/futures-macro-0.3*:= >=dev-rust/futures-macro-0.3.1 )
	( =dev-rust/proc-macro-hack-0.5*:= >=dev-rust/proc-macro-hack-0.5.9 )
	( =dev-rust/proc-macro-nested-0.1*:= >=dev-rust/proc-macro-nested-0.1.2 )
"
F_CHANNEL="
	${F_STD}
	( =dev-rust/futures-channel-0.3*:= >=dev-rust/futures-channel-0.3.1 )
"
F_COMPAT="
	${F_STD}
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.25 )
"
F_IO="
	${F_STD}
	( =dev-rust/futures-io-0.3*:= >=dev-rust/futures-io-0.3.1 )
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2 )
"
F_IO_COMPAT="
	${F_IO}
	${F_COMPAT}
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.9 )
"
F_READ_INITIALIZER="
	${F_IO}
"
F_SINK="
	( =dev-rust/futures-sink-0.3*:= >=dev-rust/futures-sink-0.3.1 )
"

BDEPEND="
	( =dev-rust/futures-core-0.3*:= >=dev-rust/futures-core-0.3.1 )
	( =dev-rust/futures-task-0.3*:= >=dev-rust/futures-task-0.3.1 )
	( =dev-rust/pin-utils-0.1*:= >=dev-rust/pin-utils-0.1.0_alpha4 )
	async-await-macro? ( ${F_ASYNC_AWAIT_MACRO} )
	channel? ( ${F_CHANNEL} )
	compat? ( ${F_COMPAT} )
	io-compat? ( ${F_IO_COMPAT} )
	io? ( ${F_IO} )
	read-initializer? ( ${F_READ_INITIALIZER} )
	sink? ( ${F_SINK} )
	std? ( ${F_STD} )
	test? (
		${F_STD}
		${F_ASYNC_AWAIT_MACRO}
		${F_CHANNEL}
		${F_COMPAT}
		${F_IO}
		${F_IO_COMPAT}
		${F_READ_INITIALIZER}
		${F_SINK}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_test() {
	# https://github.com/rust-lang/futures-rs/issues/1019
	ecargo test --tests
}
