# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Asynchronous SOCKS proxy support for Rust"
HOMEPAGE="https://github.com/sticnarf/tokio-socks"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPEND="
	( =dev-rust/once_cell-1*:= >=dev-rust/once_cell-1.2.0 )
	=dev-rust/tokio-0.2*:=[io-util,rt-threaded]
"
BDEPEND="
	=dev-rust/bytes-0.4*:=
	=dev-rust/derefable-0.1*:=
	=dev-rust/either-1*:=
	=dev-rust/failure-0.1*:=[std,derive]
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	=dev-rust/tokio-0.2*:=[io-util,stream,tcp]
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -rvf examples/ || die
	rm -vrf tests/long_username_password_auth.* \
			tests/no_auth.* \
			tests/username_auth.* || die
	default
}
src_test() {
	local targets=(
		''
		'tor'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features  --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
