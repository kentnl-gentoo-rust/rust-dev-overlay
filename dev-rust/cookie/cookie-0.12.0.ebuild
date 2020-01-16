# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Manage HTTP cookie headers and cookie jar with signed/private/encrypted jars"
HOMEPAGE="https://github.com/alexcrichton/cookie-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="percent-encode secure test"
F_PERCENT_ENCODE="
	=dev-rust/url-1*:=
"
F_SECURE="
	=dev-rust/base64-0.10*:=
	=dev-rust/ring-0.14*:=
"
BDEPEND="
	=dev-rust/time-0.1*:=
	percent-encode? ( ${F_PERCENT_ENCODE} )
	secure? ( ${F_SECURE} )
	test? (
		${F_PERCENT_ENCODE}
		${F_SECURE}
	)
"
