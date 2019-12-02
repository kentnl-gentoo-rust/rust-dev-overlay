# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A JSON serialization file format"
HOMEPAGE="https://github.com/serde-rs/json"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
BDEPEND="
	( =dev-rust/serde-0.8*:= >=dev-rust/serde-0.8.13 )
	( =dev-rust/num-traits-0.1*:= >=dev-rust/num-traits-0.1.32 )
	=dev-rust/itoa-0.1*:=
	=dev-rust/dtoa-0.2*:=
"
PATCHES=(
	"${FILESDIR}/${P}-no-clippy.patch"
)
