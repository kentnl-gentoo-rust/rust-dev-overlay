# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Token De/Serializer for testing De/Serialize implementations"
HOMEPAGE="https://github.com/serde-rs/serde"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/serde-0.8*:= >=dev-rust/serde-0.8.23 )
"
PATCHES=(
	"${FILESDIR}/${P}-path-dep.patch"
)
