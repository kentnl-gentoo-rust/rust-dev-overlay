# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Platform-agnostic accessors of timestamps in file metadata"
HOMEPAGE="https://github.com/alexcrichton/filetime"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.6 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.27 )
	test? (
		=dev-rust/tempfile-3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
