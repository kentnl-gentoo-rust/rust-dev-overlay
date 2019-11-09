# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Random number generation for Rust"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std serde1"
RESTRICT="test"
F_GETRANDOM_PACKAGE="
	( >=dev-rust/getrandom-0.1.1 )
"
F_LOG="
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.4 )
"

F_SMALL_RNG="
	=dev-rust/rand_pcg-0.2*:=
"
BDEPEND="
	( =dev-rust/rand_core-0.5*:=[std?] >=dev-rust/rand_core-0.5.1 )
	( =dev-rust/rand_chacha-0.2*:= >=dev-rust/rand_chacha-0.2.1 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.22 )
	std? (
		${F_GETRANDOM_PACKAGE}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	# Do not compile on stable: https://github.com/rust-random/rand/issues/896
	rm -vrf benches/ || die
	# Pulls in extra deps
	rm -vrf examples/ || die
	default
}
