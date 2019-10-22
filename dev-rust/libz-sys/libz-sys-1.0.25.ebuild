# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Native bindings to the system libz library (also known as zlib)"
HOMEPAGE="https://github.com/alexcrichton/libz-sys"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.43 )
	( =dev-rust/cc-1*:= >=dev-rust/cc-1.0.18 )
	( =dev-rust/pkg-config-0.3*:= >=dev-rust/pkg-config-0.3.9 )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
