# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A regular expression parser"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 ) unicode"
KEYWORDS="~amd64 ~x86"
IUSE=""
