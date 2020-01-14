# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Fast non-cryptographic hash used in rustc"
HOMEPAGE="https://github.com/rust-lang-nursery/rustc-hash"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.1 )
"
