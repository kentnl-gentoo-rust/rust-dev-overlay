# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Tools for concurrent programming"
HOMEPAGE="https://github.com/crossbeam-rs/crossbeam"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 ) BSD-2"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"

F_STD="
	=dev-rust/crossbeam-channel-0.4*:=
	=dev-rust/crossbeam-deque-0.7*:=
	=dev-rust/crossbeam-epoch-0.8*:=[std]
	=dev-rust/crossbeam-queue-0.2*:=
	=dev-rust/crossbeam-utils-0.7*:=[std]
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.2 )
	=dev-rust/crossbeam-epoch-0.8*:=
	=dev-rust/crossbeam-utils-0.7*:=
	std? ( ${F_STD} )
	test? (
		=dev-rust/rand-0.6*:=[std]
		${F_STD}
	)
"
