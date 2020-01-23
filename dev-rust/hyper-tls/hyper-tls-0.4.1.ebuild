# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Default TLS implementation for use with hyper"
HOMEPAGE="https://github.com/hyperium/hyper-tls"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="~amd64 ~x86"

IUSE="vendored test"

DEV_DEPEND="
	=dev-rust/tokio-0.2*:=[macros]
"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	=dev-rust/hyper-0.13*:=[tcp]
	=dev-rust/native-tls-0.2*:=[vendored?]
	=dev-rust/tokio-0.2*:=
	=dev-rust/tokio-tls-0.3*:=
	test? (
		=dev-rust/native-tls-0.2*:=[vendored]
		${DEV_DEPEND}
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
