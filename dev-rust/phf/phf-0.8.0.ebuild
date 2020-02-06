# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Runtime support for perfect hash function data structures"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="macros test unicase"
F_MACROS="
	=dev-rust/phf_macros-0.8*:=
	( =dev-rust/proc-macro-hack-0.5*:= >=dev-rust/proc-macro-hack-0.5.4 )
"
BDEPEND="
	macros? ( ${F_MACROS} )
	=dev-rust/phf_shared-0.8*:=[unicase?]
	test? (
		${F_MACROS}
		=dev-rust/phf_shared-0.8*:=[unicase]
	)
"
src_test() {
	ecargo test --features=macros
}
