# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Serialization framework for Rust"
HOMEPAGE="https://serde.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-stable-cargo.patch"
)
src_test() {
	# https://github.com/serde-rs/serde/issues/1658
	ecargo build --release --all-features
}
