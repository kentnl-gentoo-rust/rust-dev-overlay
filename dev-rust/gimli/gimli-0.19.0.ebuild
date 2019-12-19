# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Read and write DWARF debugging format"
HOMEPAGE="https://github.com/gimli-rs/gimli"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+write test"

F_WRITE="
	( =dev-rust/indexmap-1*:= >=dev-rust/indexmap-1.0.2 )
"
BDEPEND="
	( =dev-rust/arrayvec-0.4*:= >=dev-rust/arrayvec-0.4.6 )
	=dev-rust/byteorder-1*:=
	=dev-rust/fallible-iterator-0.2*:=
	write? ( ${F_WRITE} )
	( =dev-rust/stable_deref_trait-1*:= >=dev-rust/stable_deref_trait-1.1.0 )
	test? (
		${F_WRITE}
		( =dev-rust/crossbeam-0.7*:=[std] >=dev-rust/crossbeam-0.7.1 )
		=dev-rust/getopts-0.2*:=
		=dev-rust/memmap-0.7*:=
		=dev-rust/num_cpus-1*:=
		=dev-rust/object-0.12*:=[compression,wasm]
		=dev-rust/rayon-1*:=
		=dev-rust/regex-1*:=[perf-literal,perf-cache]
		( =dev-rust/test-assembler-0.1*:= >=dev-rust/test-assembler-0.1.3 )
		=dev-rust/typed-arena-1*:=
	)
"
src_prepare() {
	rm -vrf examples/ || die
	rm -vrf benches/ || die
	default
}
