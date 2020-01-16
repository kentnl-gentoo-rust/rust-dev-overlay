# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Safe, fast, zero-panic, crash-free, zero-allocation parsing of untrusted input"
HOMEPAGE="https://github.com/briansmith/untrusted"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"

src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
