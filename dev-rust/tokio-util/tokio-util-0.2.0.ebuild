# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Additonal utilities for working with Tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test udp"
F_UDP="
	=dev-rust/tokio-0.2*:=[udp]
"
DEV_DEPEND="
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	=dev-rust/tokio-0.2*:=[full]
	=dev-rust/tokio-test-0.2*:=
"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	=dev-rust/futures-core-0.3*:=
	=dev-rust/futures-sink-0.3*:=
	=dev-rust/log-0.4*:=
	( =dev-rust/pin-project-lite-0.1*:= >=dev-rust/pin-project-lite-0.1.1 )
	=dev-rust/tokio-0.2*:=
	udp? ( ${F_UDP} )
	test? (
		${DEV_DEPEND}
		${F_UDP}
	)
"
src_test() {
	ecargo test --all-features
}
