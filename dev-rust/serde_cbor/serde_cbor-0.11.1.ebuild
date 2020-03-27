# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="CBOR support for serde"
HOMEPAGE="https://github.com/pyfisch/cbor"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/half-1*:= >=dev-rust/half-1.2.0 )
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.14 )
	test? (
		( =dev-rust/serde_derive-1*:= >=dev-rust/serde_derive-1.0.14 )
	)
"
src_prepare() {
	if ! use test; then
		rm -vrf examples/ || die
	fi
	default
}
src_test() {
	local nodoc_targets=(
		''
		'alloc'
	)
	local targets=(
		'default'
		'std'
		'std tags'
		'std unsealed_read_write'
	)
	for i in "${nodoc_targets[@]}"; do
		einfo "Testing --features '$i' --lib --tests"
		ecargo test --no-default-features --features "${i}" --lib --tests
	done
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
