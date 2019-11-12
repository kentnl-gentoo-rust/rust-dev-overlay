# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Convert ranges of Unicode codepoints to UTF-8 byte ranges"
HOMEPAGE="https://github.com/BurntSushi/utf8-ranges"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
