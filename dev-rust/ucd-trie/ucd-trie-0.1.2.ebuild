# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A trie for storing Unicode codepoint sets and maps"
HOMEPAGE="https://github.com/BurntSushi/ucd-generate"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	test? (
		=dev-rust/lazy_static-1*:=
	)
"
