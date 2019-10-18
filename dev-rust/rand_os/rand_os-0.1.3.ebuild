# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="OS backed Random Number Generator"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
F_LOG="
	=dev-rust/log-0.4*:=
"
BDEPEND="
	=dev-rust/rand_core-0.4*:=
	=dev-rust/libc-0.2*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
