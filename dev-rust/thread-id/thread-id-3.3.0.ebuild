# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Get a unique thread ID"
HOMEPAGE="https://github.com/ruuda/thread-id"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.6 )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
