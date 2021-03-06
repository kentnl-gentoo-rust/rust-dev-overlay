# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Internal implementation of the hex-literal crate"
HOMEPAGE="https://github.com/RustCrypto/utils"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/proc-macro-hack-0.4*:=
"
