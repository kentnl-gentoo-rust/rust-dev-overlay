# Copyright 2019 Gentoo Authors
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
	=dev-rust/memmap-0.4*:=
"
BDEPEND="
	=dev-rust/byteorder-0.5*:=
	=dev-rust/regex-syntax-0.3*:=
	=dev-rust/utf8-ranges-0.1*:=
	mmap? ( ${F_MMAP} )
	test? (
		${F_MMAP}
		=dev-rust/fnv-1*:=
		=dev-rust/lazy_static-0.1*:=
		=dev-rust/quickcheck-0.2*:=
		=dev-rust/rand-0.3*:=
	)
"
src_prepare() {
	rm -rfv benches/ scripts/ || die
	default
}
