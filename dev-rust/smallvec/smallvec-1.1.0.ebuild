# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Store a small number of items on the stack in a 'small vector'"
HOMEPAGE="https://github.com/servo/rust-smallvec"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 ) "
KEYWORDS="~amd64 ~x86"
IUSE="serde test"

F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	serde? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		( =dev-rust/bincode-1*:= >=dev-rust/bincode-1.0.1 )
	)
"
src_prepare() {
	rm -vfr benches/ scripts/ || die
	default
}
