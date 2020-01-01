# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Handling fragments of UTF-8"
HOMEPAGE="https://github.com/servo/futf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/mac-0.1*:=
	=dev-rust/new_debug_unreachable-1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
