# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="unix extended filesystem attributes"
HOMEPAGE="https://github.com/Stebalien/xattr"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/tempfile-3*:=
"
BDEPEND="
	=dev-rust/libc-0.2*:=
	test? ( ${DEV_DEPEND} )
"
