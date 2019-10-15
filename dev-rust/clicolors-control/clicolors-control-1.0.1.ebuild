# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A common utility library to control CLI colorization"
HOMEPAGE="https://github.com/mitsuhiko/clicolors-control"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/lazy_static-1*:=
	=dev-rust/libc-0.2*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
