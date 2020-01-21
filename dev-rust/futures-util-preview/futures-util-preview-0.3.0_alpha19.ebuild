# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Common utilities and extension traits for the 'futures' library"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
MY_ALPHA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-alpha.${MY_ALPHA##alpha}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="channel compat io io-compat join-macro read-initializer select-macro sink +std test"
F_PROC_MACRO_HACK="
	( =dev-rust/proc-macro-hack-0.5*:= >=dev-rust/proc-macro-hack-0.5.9 )
"
F_PROC_MACRO_NESTED="
	( =dev-rust/proc-macro-nested-0.1*:= >=dev-rust/proc-macro-nested-0.1.2 )
"
F_STD="
	=dev-rust/slab-0.4*:=
"
F_CHANNEL="
	${F_STD}
	~dev-rust/futures-channel-preview-0.3.0_alpha19:=
"
F_COMPAT="
	${F_STD}
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.25 )
"
F_IO="
	${F_STD}
	~dev-rust/futures-io-preview-0.3.0_alpha19:=
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2 )
"
F_IO_COMPAT="
	${F_IO}
	${F_COMPAT}
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.9 )
"
F_JOIN_MACRO="
	~dev-rust/futures-join-macro-preview-0.3.0_alpha19:=
	${F_PROC_MACRO_HACK}
	${F_PROC_MACRO_NESTED}
"
F_READ_INITIALIZER="
	${F_IO}
"
F_SELECT_MACRO="
	~dev-rust/futures-select-macro-preview-0.3.0_alpha19:=
	${F_PROC_MACRO_HACK}
	${F_PROC_MACRO_NESTED}
"
F_SINK="
	~dev-rust/futures-sink-preview-0.3.0_alpha19:=
"
BDEPEND="
	~dev-rust/futures-core-preview-0.3.0_alpha19:=
	( =dev-rust/pin-utils-0.1*:= >=dev-rust/pin-utils-0.1.0_alpha4 )
	channel? ( ${F_CHANNEL} )
	compat? ( ${F_COMPAT} )
	io? ( ${F_IO} )
	io-compat? ( ${F_IO_COMPAT} )
	join-macro? ( ${F_JOIN_MACRO} )
	read-initializer? ( ${F_READ_INITIALIZER} )
	select-macro? ( ${F_SELECT_MACRO} )
	sink? ( ${F_SINK} )
	std? ( ${F_STD} )
	test? (
		${F_STD}
		${F_CHANNEL}
		${F_COMPAT}
		${F_JOIN_MACRO}
		${F_IO}
		${F_IO_COMPAT}
		${F_READ_INITIALIZER}
		${F_SELECT_MACRO}
		${F_SINK}
	)
"
S="${WORKDIR}/${PN}-${MY_PV}"
PATCHES=(
	"${FILESDIR}/${PN}-${MY_PV}-broken-tests.patch"
)
src_test() {
	# Doc tests broken
	ecargo test --tests
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
