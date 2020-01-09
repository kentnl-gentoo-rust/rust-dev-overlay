# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Bindings to libbrotli for decompression and compression"
HOMEPAGE="https://github.com/alexcrichton/brotli2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/quickcheck-0.4*:=[use-logging]
	=dev-rust/rand-0.3*:=
"
BDEPEND="
	( =dev-rust/brotli-sys-0.3*:= >=dev-rust/brotli-sys-0.3.1 )
	=dev-rust/libc-0.2*:=
	test? ( ${DEV_DEPEND} )
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
