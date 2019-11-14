# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Composable iterator-like futures and streams, with zero-allocation"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	# https://github.com/rust-lang-nursery/futures-rs/issues/1790
	rm -vf tests/buffer_unordered.rs || die
	default
}
