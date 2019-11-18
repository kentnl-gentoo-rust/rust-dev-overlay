# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A unified object file parser"
HOMEPAGE="https://github.com/gimli-rs/object"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+compression +wasm test"

F_FLATE2="
	=dev-rust/flate2-1*:=[rust-backend]
"
F_PARITY_WASM="
	=dev-rust/parity-wasm-0.38*:=
"
BDEPEND="
	=dev-rust/goblin-0.0.22*:=[alloc]
	=dev-rust/scroll-0.9*:=
	=dev-rust/uuid-0.7*:=
	compression? ( ${F_FLATE2} )
	wasm? ( ${F_PARITY_WASM} )
	test? (
		${F_FLATE2}
		${F_PARITY_WASM}
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
