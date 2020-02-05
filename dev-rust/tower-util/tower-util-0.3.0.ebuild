# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for working with 'Service'"
HOMEPAGE="https://github.com/tower-rs/tower"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+call-all test"

F_CALL_ALL="
	=dev-rust/futures-util-0.3*:=
"
DEV_DEPEND="
	=dev-rust/tokio-0.2*:=[stream,sync,macros]
	=dev-rust/tokio-test-0.2*:=
	=dev-rust/tower-test-0.3*:=
"
BDEPEND="
	=dev-rust/futures-core-0.3*:=
	=dev-rust/pin-project-0.4*:=
	=dev-rust/tower-service-0.3*:=
	call-all? ( ${F_CALL_ALL} )
	test? (
		${F_CALL_ALL}
		${DEV_DEPEND}
	)
"
