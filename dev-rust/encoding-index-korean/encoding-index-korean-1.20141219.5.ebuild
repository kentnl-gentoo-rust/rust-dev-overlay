# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Index tables for Korean character encodings"
HOMEPAGE="https://github.com/lifthrasiir/rust-encoding"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="CC0-1.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=(
	"${FILESDIR}/${P}-unused.patch"
)
src_test() {
	# Tests as-is will never work, they use nightly only features
	ecargo build --release
}
