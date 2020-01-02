# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit rust-crate

DESCRIPTION="Types and traits for working with bytes"
HOMEPAGE="https://github.com/carllerche/bytes"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		( =dev-rust/rand-0.3*:= >=dev-rust/rand-0.3.5 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-stripped-tests.patch"
	"${FILESDIR}/${P}-pointer-math.patch"
)
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
