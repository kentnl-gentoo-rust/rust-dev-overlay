# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Targeting utilities for compilers and related tools"
HOMEPAGE="https://github.com/CraneStation/target-lexicon"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0-with-LLVM-exceptions"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rm -vrf examples/ || die
	default
}
