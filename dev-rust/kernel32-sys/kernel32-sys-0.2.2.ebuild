# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Function definitions for Windows API kernel32"
HOMEPAGE="https://github.com/retep998/winapi-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/winapi-0.2*:= >=dev-rust/winapi-0.2.5 )
	( =dev-rust/winapi-build-0.1*:= >=dev-rust/winapi-build-0.1.1 )
"
PATCHES=(
	"${FILESDIR}/${P}-cargo-path.patch"
)
