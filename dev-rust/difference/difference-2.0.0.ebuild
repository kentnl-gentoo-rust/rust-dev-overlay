# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A Rust text diffing and assertion library"
HOMEPAGE="https://github.com/johannhof/difference.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

F_BIN="
	=dev-rust/getopts-0.2*:=
"
RESTRICT="test"
BDEPEND=""
PATCHES=(
	"${FILESDIR}/${P}-nobin-cargo.patch"
)

src_prepare() {
	# not useful in crate
	rm -vrf assets/ || die
	# pulls dev-depends
	rm -vrf examples/ || die
	# also pulls dev-depends :(
	rm src/main.rs || die
	default
}
