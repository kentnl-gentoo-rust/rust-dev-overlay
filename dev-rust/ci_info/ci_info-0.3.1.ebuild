# Copyright 2019 Gentoo Authors
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
	serde? ( ${F_SERDE} )
	test? (
		${F_SERDE}
	)
"
src_prepare() {
	# Don't compile without nightly
	rm -vrf benches/ || die
	# Causes dep explosion
	rm -vrf examples/ || die
	# Not helpful here
	rm -vrf docs/ || die
	default
}
src_test() {
	# Broken
	# https://github.com/sagiegurari/ci_info/issues/8
	ecargo test --release -- --test-threads=1
	# Fallback
	#ecargo build --release --all-targets --all-features
}
