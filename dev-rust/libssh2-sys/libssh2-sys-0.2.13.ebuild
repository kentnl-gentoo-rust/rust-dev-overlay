# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Native bindings to the libssh2 library"
HOMEPAGE="https://github.com/alexcrichton/ssh2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="vendored-openssl"

BDEPEND="
	=dev-rust/libc-0.2*:=
	( =dev-rust/libz-sys-1*:= >=dev-rust/libz-sys-1.0.21 )
	( =dev-rust/cc-1*:= >=dev-rust/cc-1.0.25 )
	( =dev-rust/pkg-config-0.3*:= >=dev-rust/pkg-config-0.3.11 )
	(
		=dev-rust/openssl-sys-0.9*:=
		>=dev-rust/openssl-sys-0.9.35
		vendored-openssl? ( dev-rust/openssl-sys[vendored] )
		test? ( dev-rust/openssl-sys[vendored] )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
