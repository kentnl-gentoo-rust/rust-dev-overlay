# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Single assignment cells and lazy values"
HOMEPAGE="https://github.com/matklad/once_cell"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="parking-lot test"

F_PARKING_LOT="
	=dev-rust/parking_lot-0.9*:=
"

BDEPEND="
	parking-lot? ( ${F_PARKING_LOT} )
	test? (
		${F_PARKING_LOT}
		=dev-rust/crossbeam-utils-0.6*:=[std]
		( =dev-rust/regex-1*:=[perf-literal,perf-cache] >=dev-rust/regex-1.2.0 )
	)
"
src_prepare() {
	eapply "${FILESDIR}/${P}-unused-examples.patch"
	rm -vrf examples/{bench{,_acquire,_vs_lazy_static},lazy_static,regex,test_synchronization}.rs || die
	if ! use test; then
		eapply "${FILESDIR}/${P}-test-examples.patch"
		rm -vrf examples/reentrant_init_deadlocks.rs || die
	fi
	default
}
src_test() {
	local targets=(
		# doc-tests fail w/o std
		# ''
		default
		std
		# doc-tests fail w/o std
		'std parking_lot'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
