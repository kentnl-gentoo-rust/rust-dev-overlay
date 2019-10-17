# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Fixed size buffer for block processing of data"
HOMEPAGE="https://github.com/RustCrypto/utils"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/block-padding-0.1*:=
	=dev-rust/byte-tools-0.3*:=
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.1 )
	=dev-rust/generic-array-0.12*:=
"
