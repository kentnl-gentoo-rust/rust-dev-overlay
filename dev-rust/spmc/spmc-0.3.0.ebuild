# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Simple SPMC channel"
HOMEPAGE="https://github.com/seanmonstar/spmc"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/loom-0.2*:= >=dev-rust/loom-0.2.2 )
"
BDEPEND="test? ( ${DEV_DEPEND}  )"
PATCHES=(
	"${FILESDIR}/${P}-no-smoke.patch"
)
