# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Diff library with semantic cleanup, based on Googles diff-match-patch"
HOMEPAGE="https://github.com/dtolnay/dissimilar"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rm -rvf benches/ || die
	default
}
