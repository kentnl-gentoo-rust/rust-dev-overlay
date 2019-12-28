# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A vector of bits"
HOMEPAGE="https://github.com/contain-rs/bit-vec"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	test? (
		( =dev-rust/rand-0.3*:= >=dev-rust/rand-0.3.15 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	rm -vrf crusader.sh deploy-docs.sh || die
	default
}
