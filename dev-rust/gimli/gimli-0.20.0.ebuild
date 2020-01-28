# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Read and write DWARF debugging format"
HOMEPAGE="https://github.com/gimli-rs/gimli"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+read +write test"

F_READ="
	( =dev-rust/arrayvec-0.5*:= >=dev-rust/arrayvec-0.4.6 )
	=dev-rust/fallible-iterator-0.2*:=
	( =dev-rust/smallvec-1*:= >=dev-rust/smallvec-1.1.0 )
	( =dev-rust/stable_deref_trait-1*:= >=dev-rust/stable_deref_trait-1.1.0 )
"
F_WRITE="
	( =dev-rust/indexmap-1*:= >=dev-rust/indexmap-1.0.2 )
"
BDEPEND="
	=dev-rust/byteorder-1*:=
	read? ( ${F_READ} )
	write? ( ${F_WRITE} )
	test? (
		${F_READ}
		${F_WRITE}
		( =dev-rust/test-assembler-0.1*:= >=dev-rust/test-assembler-0.1.3 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	rm -vrf benches/ || die
	default
}
