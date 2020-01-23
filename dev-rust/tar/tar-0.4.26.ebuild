# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Basic Rust TAR read/write with low memory occupancy"
HOMEPAGE="https://github.com/alexcrichton/tar-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test +xattr"

F_XATTR="
	=dev-rust/xattr-0.2*:=
"
DEV_DEPEND="
	=dev-rust/tempdir-0.3*:=
"
BDEPEND="
	( =dev-rust/filetime-0.2*:= >=dev-rust/filetime-0.2.6 )
	=dev-rust/libc-0.2*:=
	xattr? ( ${F_XATTR} )
	test? (
		${DEV_DEPEND}
		${F_XATTR}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
