# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Selected PCG random number generators"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde1"
RESTRICT="test"
F_SERDE="
	=dev-rust/serde-1*:=
"
F_SERDE_DERIVE="
	( =dev-rust/serde_derive-1*:= >=dev-rust/serde_derive-1.0.38 )
"
F_SERDE1="
	${F_SERDE}
	${F_SERDE_DERIVE}
"
BDEPEND="
	=dev-rust/rand_core-0.4*:=
	=dev-rust/autocfg-0.1*:=
	serde1? ( ${F_SERDE1} )
"
