# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rustls hyper integration for pure rust HTTPS"
HOMEPAGE="https://github.com/ctz/hyper-rustls"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 ISC MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="+tokio-runtime test"
F_TOKIO_RUNTIME="
	=dev-rust/hyper-0.13*:=[runtime]
	=dev-rust/ct-logs-0.6*:=
	=dev-rust/rustls-native-certs-0.1*:=
"
DEV_DEPEND="
	( =dev-rust/tokio-0.2*:=[macros,stream] >=dev-rust/tokio-0.2.4 )
"
BDEPEND="
	( =dev-rust/bytes-0.5*:= >=dev-rust/bytes-0.5.2 )
	( =dev-rust/futures-util-0.3*:=[async-await-macro,std] >=dev-rust/futures-util-0.3.1 )
	=dev-rust/hyper-0.13*:=
	=dev-rust/rustls-0.16*:=[logging]
	( =dev-rust/tokio-0.2*:= >=dev-rust/tokio-0.2.4 )
	( =dev-rust/tokio-rustls-0.12*:= >=dev-rust/tokio-rustls-0.12.1 )
	=dev-rust/webpki-0.21*:=
	tokio-runtime? ( ${F_TOKIO_RUNTIME} )
	test? (
		${DEV_DEPEND}
		${F_TOKIO_RUNTIME}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-test-target-path.patch"
)
src_prepare() {
	rm -vrf admin/ || die
	if ! use test; then
		eapply "${FILESDIR}/${P}-no-examples.patch"
		rm -rvf examples/ || die
	fi
	default
}
