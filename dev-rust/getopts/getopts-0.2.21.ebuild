# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="getopts-like option parsing"
HOMEPAGE="https://github.com/rust-lang/getopts"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/unicode-width-0.1*:= >=dev-rust/unicode-width-0.1.5 )
	test? (
		=dev-rust/log-0.4*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
