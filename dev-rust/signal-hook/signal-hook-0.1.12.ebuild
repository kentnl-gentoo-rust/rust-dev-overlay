# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Unix signal handling"
HOMEPAGE="https://github.com/vorner/signal-hook"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="mio-support tokio-support test"

F_MIO_SUPPORT="
	=dev-rust/mio-0.6*:=
"
F_TOKIO_SUPPORT="
	=dev-rust/futures-0.1*:=
	${F_MIO_SUPPORT}
	=dev-rust/tokio-reactor-0.1*:=
"
DEV_DEPEND="
	=dev-rust/tokio-0.1*:=
	=dev-rust/version-sync-0.8*:=
"
BDEPEND="
	=dev-rust/libc-0.2*:=
	=dev-rust/signal-hook-registry-1.2*:=
	mio-support? ( ${F_MIO_SUPPORT} )
	tokio-support? ( ${F_TOKIO_SUPPORT} )
	test? (
		${DEV_DEPEND}
		${F_MIO_SUPPORT}
		${F_TOKIO_SUPPORT}
	)
"
src_prepare() {
	rm -vrf benches/ examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
