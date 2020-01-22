# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A fast and correct HTTP library"
HOMEPAGE="https://github.com/hyperium/hyper"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+runtime tcp test"
F_NET2="
	( =dev-rust/net2-0.2*:= >=dev-rust/net2-0.2.32 )
"
F_TCP="
	${F_NET2}
	=dev-rust/tokio-0.2*:=[tcp,time]
"
F_RUNTIME="${F_TCP}"
DEV_DEPEND="
	=dev-rust/futures-util-0.3*:=
	=dev-rust/pretty_env_logger-0.3*:=
	( =dev-rust/tokio-0.2*:=[macros,sync,time] >=dev-rust/tokio-0.2.2 )
	=dev-rust/tokio-test-0.2*:=
	=dev-rust/url-1*:=
"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	=dev-rust/futures-channel-0.3*:=
	=dev-rust/futures-core-0.3*:=
	=dev-rust/futures-util-0.3*:=
	( =dev-rust/h2-0.2*:= >=dev-rust/h2-0.2.1 )
	=dev-rust/http-0.2*:=
	( =dev-rust/http-body-0.3*:= >=dev-rust/http-body-0.3.1 )
	=dev-rust/httparse-1*:=
	( =dev-rust/itoa-0.4*:= >=dev-rust/itoa-0.4.1 )
	=dev-rust/log-0.4*:=
	=dev-rust/pin-project-0.4*:=
	=dev-rust/time-0.1*:=
	=dev-rust/tokio-0.2*:=[sync]
	=dev-rust/tower-service-0.3*:=
	=dev-rust/want-0.3*:=
	runtime? ( ${F_RUNTIME} )
	tcp? ( ${F_TCP} )
	test? (
		${F_RUNTIME}
		${DEV_DEPEND}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-missing-targets.patch"
)
