# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A HashMap wrapper that holds key-value pairs in insertion order"
HOMEPAGE="https://github.com/contain-rs/linked-hash-map"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="heapsize-impl serde-impl test"

F_HEAPSIZE_IMPL="
	=dev-rust/heapsize-0.4*:=
"
F_SERDE_IMPL="
	${F_HEAPSIZE_IMPL}
	=dev-rust/serde-1*:=
	=dev-rust/serde_test-1*:=
"
BDEPEND="
	heapsize-impl? ( ${F_HEAPSIZE_IMPL} )
	serde-impl? ( ${F_SERDE_IMPL} )
	test? ( ${F_SERDE_IMPL} )
"

PATCHES=(
	"${FILESDIR}/${P}-bad-cargo-features.patch"
)
