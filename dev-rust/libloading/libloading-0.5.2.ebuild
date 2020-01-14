# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A safer bindingh to platforms dynamic library loading utilities"
HOMEPAGE="https://github.com/nagisa/rust_libloading"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/cc-1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
