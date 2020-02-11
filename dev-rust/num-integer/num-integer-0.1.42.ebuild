# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Integer traits and functions"
HOMEPAGE="https://github.com/rust-num/num-integer"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( =dev-rust/num-traits-0.2*:= >=dev-rust/num-traits-0.2.11 )
	=dev-rust/autocfg-1*:=
"
src_prepare() {
	rm -vrf benches/
	default
}
src_test() {
	local targets=(
		''
		default
		i128
		std
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
