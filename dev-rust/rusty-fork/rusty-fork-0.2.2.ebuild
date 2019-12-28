# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Cross-platform API for running tests in a fork-like way"
HOMEPAGE="https://github.com/altsysrq/rusty-fork"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+timeout test"
F_TIMEOUT="
	=dev-rust/wait-timeout-0.2*:=
"
BDEPEND="
	=dev-rust/fnv-1*:=
	( =dev-rust/quick-error-1*:= >=dev-rust/quick-error-1.2 )
	=dev-rust/tempfile-3*:=
	=dev-rust/libc-0.2*:=
	timeout? ( ${F_TIMEOUT} )
	test? ( ${F_TIMEOUT} )
"
