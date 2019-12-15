# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Word wrapping, indenting and deindenting strings"
HOMEPAGE="https://github.com/mgeisler/textwrap"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="hyphenation term-size test"

F_HYPHENATION="
	( =dev-rust/hyphenation-0.7*:=[embed-all] >=dev-rust/hyphenation-0.7.1 )
"
F_TERM_SIZE="
	=dev-rust/term_size-0.3*:=
"
BDEPEND="
	( =dev-rust/unicode-width-0.1*:= >=dev-rust/unicode-width-0.1.3 )
	hyphenation? ( ${F_HYPHENATION} )
	term-size? ( ${F_TERM_SIZE} )
	test? (
		=dev-rust/version-sync-0.6*:=
		${F_HYPHENATION}
		${F_TERM_SIZE}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-benches.patch"
)
src_prepare() {
	rm -vrf examples/ benches/ || die
	default
}
