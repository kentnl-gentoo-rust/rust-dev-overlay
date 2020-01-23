# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="x-www-form-urlencoded for Serde"
HOMEPAGE="https://github.com/nox/serde_urlencoded"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/serde_derive-1*:=
"
BDEPEND="
	=dev-rust/dtoa-0.4*:=
	=dev-rust/itoa-0.4*:=
	=dev-rust/serde-1*:=
	=dev-rust/url-2*:=
	test? ( ${DEV_DEPEND} )
"
