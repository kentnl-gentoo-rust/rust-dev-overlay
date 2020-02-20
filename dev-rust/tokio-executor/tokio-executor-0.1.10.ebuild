# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Future execution primitives"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/crossbeam-utils-0.7*:=[std]
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	test? (
		( =dev-rust/tokio-0.1*:=[codec,fs,io,reactor,rt-full,sync,timer,udp,uds] >=dev-rust/tokio-0.1.18 )
	)
"
