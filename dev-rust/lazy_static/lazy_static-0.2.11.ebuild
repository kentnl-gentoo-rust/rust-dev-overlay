# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A macro for declaring lazily evaluated statics"
HOMEPAGE="https://github.com/rust-lang-nursery/lazy-static.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-doctests.patch"
	"${FILESDIR}/${P}-no-nightly.patch"
)
src_prepare() {
	rm -rvf tests/compile-fail tests/compile_tests.rs || die
	default
}
