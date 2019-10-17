# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="pest's derive macro"
HOMEPAGE="https://github.com/pest-parser/pest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( =dev-rust/pest-2*:= >=dev-rust/pest-2.1 )
	( =dev-rust/pest_generator-2*:= >=dev-rust/pest_generator-2.1 )
"
