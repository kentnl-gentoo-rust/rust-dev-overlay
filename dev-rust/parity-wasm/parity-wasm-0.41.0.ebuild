# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="WebAssembly low-level format library"
HOMEPAGE="https://github.com/paritytech/parity-wasm"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
	"${FILESDIR}/${P}-no-example-deps.patch"
)
src_prepare() {
	# Pulls dev-deps and optional deps
	rm -vrf examples/ || die
	default
}
