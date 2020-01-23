# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Non-blocking SSL/TLS streams for Tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

DEV_DEPEND="
	=dev-rust/cfg-if-0.1*:=
	=dev-rust/env_logger-0.6*:=
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	=dev-rust/tokio-0.2*:=[macros,stream,io-util,net]
	=dev-rust/openssl-0.10*:=
"
BDEPEND="
	=dev-rust/native-tls-0.2*:=
	=dev-rust/tokio-0.2*:=
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-network-tests.patch"
)
src_prepare() {
	rm -vrf examples_old/ || die
	default
}
