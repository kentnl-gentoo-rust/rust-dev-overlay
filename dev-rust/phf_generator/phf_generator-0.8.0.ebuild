# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="PHF Generation logic"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/phf_shared-0.8*:=
	=dev-rust/rand-0.7*:=[std,small_rng]
"
PATCHES=(
	"${FILESDIR}/${P}-nobenchbin.patch"
)
src_prepare() {
	rm -vrf benches/ \
		src/bin/ || die
	default
}
