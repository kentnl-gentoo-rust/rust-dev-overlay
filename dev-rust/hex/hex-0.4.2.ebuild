# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Encode/decode data into/from hexadecimal representation"
HOMEPAGE="https://github.com/KokaKiwi/rust-hex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde test"
F_SERDE="=dev-rust/serde-1*:="
DEV_DEPEND="
	=dev-rust/pretty_assertions-0.6*:=
	=dev-rust/serde-1*:=[derive]
	=dev-rust/serde_json-1*:=
	=dev-rust/version-sync-0.8*:=
"
BDEPEND="
	serde? ( ${F_SERDE} )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-nobenches.patch"
)
src_prepare() {
	rm -rfv benches/ || die
	default
}
src_test() {
	local targets=(
		''
		'default'
		# serde requires std
		'serde std'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
