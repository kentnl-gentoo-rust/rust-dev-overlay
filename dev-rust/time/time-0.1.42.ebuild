# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for working with time-related functions"
HOMEPAGE="https://github.com/rust-lang/time"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
BDEPEND="
	( =dev-rust/libc-0.2*:=  >=dev-rust/libc-0.2.1 )
"
src_test() {
	# upstream makes all warnings fatal, and currently has warnings
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
