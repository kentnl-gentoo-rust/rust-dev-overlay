# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A cross platform library for writing coloured text to a terminal"
HOMEPAGE="https://github.com/BurntSushi/termcolor"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
