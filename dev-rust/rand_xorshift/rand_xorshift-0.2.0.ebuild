# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Xorshift random number generator"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde1 test"

F_SERDE1="
	=dev-rust/serde-1*:=[derive]
"
BDEPEND="
	=dev-rust/rand_core-0.5*:=
	serde1? ( ${F_SERDE1} )
	test? (
		=dev-rust/bincode-1*:=
		${F_SERDE1}
	)
"
