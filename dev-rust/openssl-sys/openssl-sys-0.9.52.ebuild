# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="FFI bindings to OpenSSL"
HOMEPAGE="https://github.com/sfackler/rust-openssl"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="vendored test"

F_VENDORED="
	( =dev-rust/openssl-src-111*:= >=dev-rust/openssl-src-111.0.1 )
"
BDEPEND="
	=dev-rust/libc-0.2*:=
	( =dev-rust/autocfg-0.1*:= >=dev-rust/autocfg-0.1.2 )
	=dev-rust/cc-1*:=
	( =dev-rust/pkg-config-0.3*:= >=dev-rust/pkg-config-0.3.9 )
	vendored? ( ${F_VENDORED} )
	test? ( ${F_VENDORED} )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
