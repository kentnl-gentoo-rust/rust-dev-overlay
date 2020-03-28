# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Random number generation for Rust"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="log +std serde1 small_rng test"
F_GETRANDOM_PACKAGE="
	( >=dev-rust/getrandom-0.1.1 )
"
F_LIBC="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.22 )
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
	log? ( ${F_LOG} )
	small_rng? ( ${F_SMALL_RNG} )
	std? (
		${F_GETRANDOM_PACKAGE}
		${F_LIBC}
	)
	test? (
		=dev-rust/rand_hc-0.2*:=
		${F_LIBC}
		${F_LOG}
		${F_SMALL_RNG}
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
my_dotest() {
	local features=$1
	shift
	einfo "Testing --features \"${features}\" $@"
	ecargo test --no-default-features --features "${features}" "$@"
}
src_test() {
	# doc tests all require std
	my_dotest '' --lib --tests
	my_dotest getrandom_package --lib --tests
	my_dotest log --lib --tests
	my_dotest rand_pcg --lib --tests
	my_dotest alloc --lib --tests
	my_dotest default
	my_dotest getrandom --lib --tests
	my_dotest serde1 --lib --tests
	my_dotest small_rng --lib --tests
	my_dotest std
	einfo "Testing --all-features"
	ecargo test --all-features
}
