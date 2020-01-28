# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A unified object file parser"
HOMEPAGE="https://github.com/gimli-rs/object"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+compression +wasm write test"

F_FLATE2="
	=dev-rust/flate2-1*:=[rust-backend]
"
F_PARITY_WASM="
	=dev-rust/parity-wasm-0.41*:=
"
F_WRITE="
	( =dev-rust/crc32fast-1*:= >=dev-rust/crc32fast-1.2 )
	( =dev-rust/indexmap-1*:= >=dev-rust/indexmap-1.1 )
"
BDEPEND="
	=dev-rust/goblin-0.1*:=[alloc]
	=dev-rust/scroll-0.10*:=
	=dev-rust/target-lexicon-0.10*:=
	=dev-rust/uuid-0.8*:=
	compression? ( ${F_FLATE2} )
	wasm? ( ${F_PARITY_WASM} )
	write? ( ${F_WRITE} )
	test? (
		${F_FLATE2}
		${F_PARITY_WASM}
		${F_WRITE}
	)
"

PATCHES=(
	"${FILESDIR}/${P}-no-example-deps.patch"
)
src_prepare() {
	# Pulls dev-deps and optional deps
	rm -vrf examples/ || die
	default
}
