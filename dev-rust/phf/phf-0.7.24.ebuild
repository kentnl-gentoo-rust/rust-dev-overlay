# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Runtime support for perfect hash function data structures"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="macros test unicase"
# Tests are broken in weird ways, revisit this after checking they
# exist in latest version
RESTRICT="test"
F_MACROS="
	( =dev-rust/phf_macros-0.7*:= >=dev-rust/phf_macros-0.7.24 )
"
BDEPEND="
	macros? ( ${F_MACROS} )
	( =dev-rust/phf_shared-0.7*:=[unicase?] >=dev-rust/phf_shared-0.7.24 )
	test? (
		${F_MACROS}
		=dev-rust/phf_shared-0.7*:=[unicase]
	)
"
