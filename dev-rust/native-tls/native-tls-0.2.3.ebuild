# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A wrapper over a platforms native TLS implementation"
HOMEPAGE="https://github.com/sfackler/rust-native-tls"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test vendored"
DEV_DEPEND="
	=dev-rust/hex-0.3*:=
"
BDEPEND="
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.5 )
	( =dev-rust/openssl-0.10*:=[vendored?] >=dev-rust/openssl-0.10.15 )
	=dev-rust/openssl-probe-0.1*:=
	( =dev-rust/openssl-sys-0.9*:= >=dev-rust/openssl-sys-0.9.30 )
	test? (
		=dev-rust/openssl-0.10*:=[vendored]
		${DEV_DEPEND}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-network-tests.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
