# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core random number generator traits and implementation tools"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test serde1"

BDEPEND="
	=dev-rust/rand_core-0.3*:=[serde1?]
	test? (
		=dev-rust/rand_core-0.3*:=[serde1]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-shimfix.patch"
)
