# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="The Elegant Parser"
HOMEPAGE="https://github.com/pest-parser/pest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test pretty-print"

F_PRETTY_PRINT="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.89 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_json-1.0.39 )
"
BDEPEND="
	( =dev-rust/ucd-trie-0.1* >=dev-rust/ucd-trie-0.1.1 )
	test? (
		${F_PRETTY_PRINT}
	)
"
src_prepare() {
	# pulls in all optional deps
	rm -vrf examples/ || die
	default
}
