# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Compile-time assertions to ensure that invariants are met"
HOMEPAGE="https://github.com/nvzqz/static-assertions-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

src_test() {
	local targets=(
		''
		'nightly'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
