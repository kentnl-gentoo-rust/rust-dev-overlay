# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Helpers to test partial, interrupted and would-block I/O operations"
HOMEPAGE="https://github.com/facebookincubator/rust-partial-io"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="quickcheck tokio test"
F_QUICKCHECK="
	=dev-rust/quickcheck-0.4*:=[use-logging]
"
F_TOKIO="
	=dev-rust/tokio-io-0.1*:=
	=dev-rust/futures-0.1*:=
"
DEV_DEPENDS="
	=dev-rust/quickcheck-0.4*:=[use-logging]
	=dev-rust/tokio-core-0.1*:=
"
BDEPEND="
	=dev-rust/libc-0.2*:=
	=dev-rust/cc-1*:=
	quickcheck? ( ${F_QUICKCHECK} )
	tokio? ( ${F_TOKIO} )
	test? (
		${DEV_DEPENDS}
		${F_TOKIO}
		${F_QUICKCHECK}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
