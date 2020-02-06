# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="libm in pure Rust"
HOMEPAGE="https://github.com/rust-lang/libm"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPEND="
	( =dev-rust/no-panic-0.1*:= >=dev-rust/no-panic-0.1.8 )
"
BDEPEND="test? ( ${DEV_DEPEND} )"
PATCHES=(
	"${FILESDIR}/${P}-nomusl.patch"
)
src_prepare() {
	rm -vrf ci/ || die
	default
}
