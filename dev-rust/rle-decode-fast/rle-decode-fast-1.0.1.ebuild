# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Fast decoding of Run Length Encoded data"
HOMEPAGE="https://github.com/WanzenBug/rle-decode-helper"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="~amd64 ~x86"
PATCHES=(
	"${FILESDIR}/${P}-decruft.patch"
)
src_prepare() {
	rm -vrf benches/ docs/ || die
	default
}
