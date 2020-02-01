# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Compact representation of large sets of strings with finite state transducers"
HOMEPAGE="https://github.com/BurntSushi/fst"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="+mmap"

F_MMAP="
	=dev-rust/memmap-0.6*:=
"
BDEPEND="
	=dev-rust/byteorder-1*:=
	mmap? ( ${F_MMAP} )
	test? (
		${F_MMAP}
		=dev-rust/quickcheck-0.7*:=
		=dev-rust/rand-0.5*:=[std]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-benches.patch"
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	rm -rfv appveyor.yml session.vim .travis.yml benches/ ci/ scripts/ || die
	default
}
