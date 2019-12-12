# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Proemial code for the 'hyphenation' crate"
HOMEPAGE="https://github.com/tapeinosyne/hyphenation"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/atlatl-0.1*:=[serde] >=dev-rust/atlatl-0.1.2 )
	=dev-rust/serde-1*:=[derive]
"
