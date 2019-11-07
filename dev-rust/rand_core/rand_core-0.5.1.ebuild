# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core random number generator traits and implementation tools"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde1 std test"

F_SERDE1="
	=dev-rust/serde-1*:=[derive]
"
F_GETRANDOM="
	=dev-rust/getrandom-0.1*:=
"
BDEPEND="
	serde1? ( ${F_SERDE1} )
	std? ( ${F_GETRANDOM} )
	test? (
		${F_SERDE1}
		${F_GETRANDOM}
	)
"
