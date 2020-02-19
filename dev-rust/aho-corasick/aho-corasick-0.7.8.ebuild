# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Fast multiple substring searching"
HOMEPAGE="https://github.com/BurntSushi/aho-corasick"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2.0 )
	test? (
		( =dev-rust/doc-comment-0.3*:= >=dev-rust/doc-comment-0.3.1 )
	)
"
src_test() {
	local targets=(
		# error, std required to build this crate
		# ''
		'default'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
