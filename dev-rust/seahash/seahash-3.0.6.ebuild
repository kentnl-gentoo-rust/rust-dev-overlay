# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A blazingly fast, portable hash function with proven statistical guarantees"
HOMEPAGE="https://gitlab.redox-os.org/redox-os/seahash"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-buffer-pop.patch"
)
src_prepare() {
	rm -vrf benches || die
	default
}
