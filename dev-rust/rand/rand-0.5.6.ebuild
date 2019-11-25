# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Random number generation for Rust"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="log +std serde1"
F_LOG="
	=dev-rust/log-0.4*:=
"
F_SERDE="
	=dev-rust/serde-1*:=
"
F_SERDE_DERIVE="
	=dev-rust/serde_derive-1*:=
"
F_LIBC="
	=dev-rust/libc-0.2*:=
"
F_SERDE1="
	${F_SERDE}
	${FSERDE_DERIVE}
"
F_STD="
	${F_LIBC}
"
BDEPEND="
	=dev-rust/rand_core-0.3*:=[serde1?]
	log? ( ${F_LOG} )
	serde1? ( ${F_SERDE1} )
	std? ( ${F_STD} )
	test? (
		=dev-rust/bincode-1*:=
		${F_LOG}
		${F_SERDE1}
		${F_STD}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-no-deny-warn.patch"
)
src_prepare() {
	# Do not compile on stable: https://github.com/rust-random/rand/issues/896
	rm -vrf benches/ || die
	# Pulls in extra deps
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
