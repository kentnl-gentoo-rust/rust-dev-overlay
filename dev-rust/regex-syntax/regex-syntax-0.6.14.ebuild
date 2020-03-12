# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A regular expression parser"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 ) unicode"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	rm -vrf benches/ || die
	default
}
src_test() {
	local targets=(
		''
		'default'
		'unicode'
		'unicode-age'
		'unicode-bool'
		'unicode-case'
		'unicode-gencat'
		'unicode-perl'
		'unicode-script'
		'unicode-segment'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
