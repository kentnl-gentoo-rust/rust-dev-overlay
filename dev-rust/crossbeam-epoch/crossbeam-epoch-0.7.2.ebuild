# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Epoch-based garbage collector"
HOMEPAGE="https://github.com/crossbeam-rs/crossbeam"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"
F_LAZY_STATIC="
	=dev-rust/lazy_static-1*:=
"
F_STD="
	=dev-rust/crossbeam-utils-0.6*:=[std]
	${F_LAZY_STATIC}
"
BDEPEND="
	=dev-rust/arrayvec-0.4*:=
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.2 )
	=dev-rust/crossbeam-utils-0.6*:=
	=dev-rust/memoffset-0.5*:=
	=dev-rust/scopeguard-1*:=
	std? ( ${F_STD} )
	test? (
		${F_STD}
		=dev-rust/rand-0.6*:=[std]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-stable-cargo.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
