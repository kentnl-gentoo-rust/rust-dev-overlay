# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Replacements for assert_eq and assert_ne with colourful diffs"
HOMEPAGE="https://github.com/colin-kiegel/rust-pretty-assertions"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/ansi_term-0.11*:=
	=dev-rust/difference-2*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-broken-test.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
