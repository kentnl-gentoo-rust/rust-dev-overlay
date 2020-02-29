# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A RAII scope guard that runs a given closure when it goes out of scope"
HOMEPAGE="https://github.com/bluss/scopeguard"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	local targets=(
		''
		'default'
		'use_std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
