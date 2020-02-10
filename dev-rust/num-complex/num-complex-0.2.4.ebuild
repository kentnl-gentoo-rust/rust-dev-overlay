# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Complex numbers implementation"
HOMEPAGE="https://github.com/rust-num/num-complex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="rand serde test"

F_RAND="
	=dev-rust/rand-0.5*:=
"
F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	( =dev-rust/num-traits-0.2*:= >=dev-rust/num-traits-0.2.11 )
	=dev-rust/autocfg-1*:=
	rand? ( ${F_RAND} )
	serde? ( ${F_SERDE} )
	test? (
		${F_RAND}
		${F_SERDE}
	)
"
src_test() {
	for i in default i128 $(usev rand) $(usev serde); do
		einfo "Testing --features '$i'"
		ecargo test --features "${i}" || die "Test suite with --features ${i} failed"
	done
	einfo "Testing --all-features"
	ecargo test --all-features || die "Test suite with --all-features failed"
}
