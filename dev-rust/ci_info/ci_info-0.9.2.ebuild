# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Provides current CI environment information"
HOMEPAGE="https://github.com/sagiegurari/ci_info"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="test serde"
F_SERDE="
	=dev-rust/serde-1*:=
	=dev-rust/serde_derive-1*:=
"
BDEPEND="
	=dev-rust/envmnt-0.8*:=
	serde? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		=dev-rust/lazy_static-1*:=
	)
"
src_prepare() {
	rm -vrf Makefile.toml benches/ examples/ docs/ || die
	default
}
my_test() {
	einfo "Testing $(printf "%q " "$@")"
	ecargo test "$@"
}
src_test() {
	my_test --no-default-features
	my_test --no-default-features --features 'serde'
	my_test --no-default-features --features 'serde_derive'
	my_test --no-default-features --features 'serde-1'
	my_test --all-features
}
