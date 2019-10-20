# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Determine whether two file paths point to the same file"
HOMEPAGE="https://github.com/BurntSushi/same-file"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE=""
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
