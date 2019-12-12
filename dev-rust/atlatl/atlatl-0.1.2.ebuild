# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Double-array tries"
HOMEPAGE="https://github.com/tapeinosyne/atlatl"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="serde"

F_SERDE="
	=dev-rust/serde-1*:=[derive]
"
BDEPEND="
	=dev-rust/fnv-1*:=
	=dev-rust/num-traits-0.2*:=
	serde? ( ${F_SERDE} )
	test? (
		=dev-rust/fst-0.1*:=[mmap]
		( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.1 )
		=dev-rust/quickcheck-0.7*:=[regex,use-logging]
		=dev-rust/rand-0.5*:=[std]
		${F_SERDE}
	)
"
src_prepare() {
	rm -rfv benches/ || die
	default
}
