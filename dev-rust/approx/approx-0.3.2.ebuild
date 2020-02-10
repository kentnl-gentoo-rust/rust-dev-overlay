# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Approximate floating point equality comparisons and assertions"
HOMEPAGE="https://github.com/brendanzab/approx"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="num-complex test"

F_NUM_COMPLEX="
	=dev-rust/num-complex-0.2*:=
"
BDEPEND="
	=dev-rust/num-traits-0.2*:=
	num-complex? ( ${F_NUM_COMPLEX} )
	test? (
		${F_NUM_COMPLEX}
	)
"
src_test() {
	for i in default num-complex; do
		einfo "Testing --features '$i'"
		ecargo test --features "${i}" || die "Test suite with --features ${i} failed"
	done
	einfo "Testing --all-features"
	ecargo test --all-features || die "Test suite with --all-features failed"
}
