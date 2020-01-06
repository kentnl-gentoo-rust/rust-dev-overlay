# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Hash Table with consistent order and fast iteration"
HOMEPAGE="https://github.com/bluss/indexmap"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="rayon serde test"

F_RAYON="
	=dev-rust/rayon-1*:=
"
F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	rayon? ( ${F_RAYON} )
	serde? ( ${F_SERDE} )
	( =dev-rust/autocfg-0.1*:= >=dev-rust/autocfg-0.1.6 )
	test? (
		${F_RAYON}
		${F_SERDE}
		=dev-rust/fnv-1*:=
		=dev-rust/itertools-0.8*:=
		( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.3 )
		=dev-rust/quickcheck-0.8*:=
		=dev-rust/rand-0.6*:=[std]
		( =dev-rust/serde_test-1*:= >=dev-rust/serde_test-1.0.99 )
	)
"
