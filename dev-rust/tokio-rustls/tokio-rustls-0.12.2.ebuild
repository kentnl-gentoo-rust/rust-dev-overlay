# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Async TLS/SSL for Tokio using Rustls"
HOMEPAGE="https://github.com/quininer/tokio-rustls"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test unstable"
F_UNSTABLE="
	=dev-rust/bytes-0.5*:=
"
DEV_DEPEND="
	( =dev-rust/futures-util-0.3*:=[async-await-macro,std] >=dev-rust/futures-util-0.3.1 )
	=dev-rust/lazy_static-1*:=
	=dev-rust/tokio-0.2*:=[macros,net,io-util,time]
	=dev-rust/webpki-roots-0.18*:=
"
BDEPEND="
	( =dev-rust/futures-core-0.3*:= >=dev-rust/futures-core-0.3.1 )
	=dev-rust/rustls-0.16*:=[logging]
	=dev-rust/tokio-0.2*:=
	=dev-rust/webpki-0.21*:=
	unstable? ( ${F_UNSTABLE} )
	test? (
		${F_UNSTABLE}
		${DEV_DEPEND}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-network.patch"
)
