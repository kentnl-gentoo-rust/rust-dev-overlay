# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Generic endian-aware read/write traits for byte buffers"
HOMEPAGE="https://github.com/m4b/scroll"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RESTRICT="test"
BDEPEND="
	=dev-rust/rustc_version-0.2*:=
"
src_prepare() {
	eapply "${FILESDIR}/${P}-no-bench-deps.patch"
	rm -vrf examples/ benches/ || die
	default
}
