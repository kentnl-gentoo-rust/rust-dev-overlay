# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A simple interface for querying atty"
HOMEPAGE="https://github.com/softprops/atty"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/libc-0.2*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-stdin-test.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
