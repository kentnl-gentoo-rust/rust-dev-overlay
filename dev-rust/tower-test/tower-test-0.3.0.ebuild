# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for writing client and server 'Service' tests"
HOMEPAGE="https://github.com/tower-rs/tower"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPEND="
	=dev-rust/tokio-0.2*:=[macros]
"
BDEPEND="
	=dev-rust/futures-util-0.3*:=
	=dev-rust/pin-project-0.4*:=
	=dev-rust/tokio-0.2*:=[sync]
	=dev-rust/tokio-test-0.2*:=
	=dev-rust/tower-layer-0.3*:=
	=dev-rust/tower-service-0.3*:=
	test? ( ${DEV_DEPEND} )
"
