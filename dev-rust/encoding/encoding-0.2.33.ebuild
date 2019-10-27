# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Character encodingh support for Rust"
HOMEPAGE="https://github.com/lifthrasiir/rust-encoding"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( >=dev-rust/encoding-index-singlebyte-1.20141219.5:= <dev-rust/encoding-index-singlebyte-1.20141220.0 )
	( >=dev-rust/encoding-index-korean-1.20141219.5:= <dev-rust/encoding-index-korean-1.20141220.0 )
	( >=dev-rust/encoding-index-japanese-1.20141219.5:= <dev-rust/encoding-index-japanese-1.20141220.0 )
	( >=dev-rust/encoding-index-simpchinese-1.20141219.5:= <dev-rust/encoding-index-simpchinese-1.20141220.0 )
	( >=dev-rust/encoding-index-tradchinese-1.20141219.5:= <dev-rust/encoding-index-tradchinese-1.20141220.0 )
"
PATCHES=(
	"${FILESDIR}/${P}-nopath-cargo.patch"
)

src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	# Tests as-is will never work, they use nightly only features
	ecargo build --release
}
