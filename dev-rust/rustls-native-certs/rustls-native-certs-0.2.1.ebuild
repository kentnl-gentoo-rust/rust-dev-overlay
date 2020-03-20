# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Allow rustls to use platform native certificate store"
HOMEPAGE="https://github.com/ctz/rustls-native-certs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 ISC MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/ring-0.16*:=[dev-urandom-fallback] >=dev-rust/ring-0.16.5 )
	=dev-rust/untrusted-0.7*:=
	=dev-rust/webpki-0.21*:=
	dev-rust/webpki-roots:=
"
BDEPEND="
	=dev-rust/rustls-0.16*:=[logging]
	( =dev-rust/openssl-probe-0.1*:= >=dev-rust/openssl-probe-0.1.2 )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${PN}-0.1.0-network-tests.patch"
)
src_prepare() {
	rm -vrf .azure-pipelines.yml admin/ examples/ integration-tests/ || die
	default
}
