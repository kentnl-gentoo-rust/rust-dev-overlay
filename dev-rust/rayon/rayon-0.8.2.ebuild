# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Simple work-stealing parallelism for Rust"
HOMEPAGE="https://github.com/rayon-rs/rayon"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/rayon-core-1*:= >=dev-rust/rayon-core-1.2 )
	test? (
		=dev-rust/rand-0.3*:=
		( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.7 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	# Pulls extra deps
	rm -vrf examples/ || die
	default
}
