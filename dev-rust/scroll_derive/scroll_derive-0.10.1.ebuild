# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Derive Pread and Pwrite traits from the scroll crate"
HOMEPAGE="https://github.com/m4b/scroll"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
DEV_DEPEND="
	=dev-rust/scroll-0.10*:=
"
BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-missing-test-deps.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
