# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="A modern TLS library written in Rust"
HOMEPAGE="https://github.com/ctz/rustls"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 ISC MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="+logging"
RESTRICT="test"
F_LOGGING="
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.4 )
"
BDEPEND="
	=dev-rust/base64-0.10*:=
	logging? ( ${F_LOGGING} )
	( =dev-rust/ring-0.16*:= >=dev-rust/ring-0.16.5 )
	=dev-rust/sct-0.6*:=
	=dev-rust/webpki-0.21*:=
"

PATCHES=(
	"${FILESDIR}/${P}-no-excess-deps.patch"
)
