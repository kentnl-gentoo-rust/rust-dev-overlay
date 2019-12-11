# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Read number in big and little endian"
HOMEPAGE="https://github.com/BurntSushi/byteorder"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/quickcheck-0.2*:=
		=dev-rust/rand-0.3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
