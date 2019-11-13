# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A lazily filled Cell struct"
HOMEPAGE="https://github.com/indiv0/lazycell"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
