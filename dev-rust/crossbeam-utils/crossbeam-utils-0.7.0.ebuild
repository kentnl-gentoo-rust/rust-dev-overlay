# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for concurrent programming"
HOMEPAGE="https://github.com/crossbeam-rs/crossbeam"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"

F_LAZY_STATIC="
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.1 )
"
F_STD="${F_LAZY_STATIC}"

BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.2 )
	( =dev-rust/autocfg-0.1*:= >=dev-rust/autocfg-0.1.6 )
	std? ( ${F_STD} )
	test? (
		${F_STD}
		=dev-rust/rand-0.6*:=[std]
	)
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
