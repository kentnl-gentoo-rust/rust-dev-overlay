# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Cross-platform memory-mapped file IO"
HOMEPAGE="https://github.com/danburkert/memmap-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/libc-0.2*:=
	test? (
		=dev-rust/tempdir-0.3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	# Not useful here
	rm -vrf ci/ || die
	# Pulls dev-deps and optional deps
	rm -vrf examples/ || die
	default
}
