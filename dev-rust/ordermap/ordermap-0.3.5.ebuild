# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A hash table with consistent order and fast iteration"
HOMEPAGE="https://github.com/bluss/ordermap"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde-1"
RESTRICT="test"
F_SERDE_1="
	=dev-rust/serde-1*:=
"

BDEPEND="
	serde-1? ( ${F_SERDE_1} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench-deps.patch"
)
src_prepare() {
	rm -vr benches/ || die
	default
}
