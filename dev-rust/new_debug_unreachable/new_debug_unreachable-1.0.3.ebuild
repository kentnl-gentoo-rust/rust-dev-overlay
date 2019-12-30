# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Panic in debug, intrinsics::unreachable in release"
HOMEPAGE="https://github.com/mbrubeck/rust-debug-unreachable"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rm -vrf examples/ || die
	default
}

src_test() {
	# Optimization makes the code intentionally trigger a SIGILL
	# But test expects a trappable panic
	RUSTFLAGS="${RUSTFLAGS} -Copt-level=0" rust-crate_src_test
}
