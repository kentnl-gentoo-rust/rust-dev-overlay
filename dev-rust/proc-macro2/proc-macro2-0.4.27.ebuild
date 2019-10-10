# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Stable implemntation of the upcoming 'proc_macro' API"
HOMEPAGE="https://github.com/alexcrichton/proc-macro2"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/unicode-xid-0.1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-testfix.patch"
)
