# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Random number generation for Rust"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std serde1 test"

## wtf do I do with this?
F_LOG="
	=dev-rust/log-0.4*:=
"

F_RAND_OS="
	=dev-rust/rand_os-0.1*:=
"
F_STD="
	${F_RAND_OS}
"
F_SERDE1="
	=dev-rust/rand_core-0.4*:=[serde1]
	=dev-rust/rand_isaac-0.1*:=[serde1]
	=dev-rust/rand_xorshift-0.1*:=[serde1]
"
BDEPEND="
	=dev-rust/rand_chacha-0.1*:=
	=dev-rust/rand_core-0.4*:=
	=dev-rust/rand_hc-0.1*:=
	=dev-rust/rand_isaac-0.1*:=
	=dev-rust/rand_jitter-0.1*:=
	=dev-rust/rand_pcg-0.1*:=
	=dev-rust/rand_xorshift-0.1*:=
	=dev-rust/autocfg-0.1*:=
	=dev-rust/libc-0.2*:=
	serde1? ( ${F_SERDE1} )
	std? ( ${F_STD} )
	test? (
		${F_LOG}
		${F_SERDE1}
		${F_STD}
		( =dev-rust/average-0.9*:= >=dev-rust/average-0.9.2 )
		=dev-rust/rand_xoshiro-0.1*:=
	)

"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-no-simd.patch"
)
src_prepare() {
	# Do not compile on stable: https://github.com/rust-random/rand/issues/896
	rm -vrf benches/ || die
	# Pulls in extra deps
	rm -vrf examples/ || die
	default
}
