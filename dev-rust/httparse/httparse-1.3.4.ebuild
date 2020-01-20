# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A tiny, safe, speedy, zero-copy HTTP/1.x parser"
HOMEPAGE="https://github.com/seanmonstar/httparse"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/pico-sys-0.0*:=
"
BDEPEND="
	test? ( ${DEV_DEPEND} )
"
