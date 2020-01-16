# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

MY_PV="${PV}+zstd.1.4.4"
DESCRIPTION="Bindings for the zstd compression library"
HOMEPAGE="https://github.com/gyscos/zstd-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="bindgen tokio test"
F_TOKIO="
	=dev-rust/tokio-io-0.1*:=
	=dev-rust/futures-0.1*:=
"
F_BINDGEN="
	~dev-rust/zstd-safe-2.0.3:=[bindgen]
"
DEV_DEPEND="
	=dev-rust/partial-io-0.3*:=
	=dev-rust/quickcheck-0.6*:=[regex,use-logging]
	( =dev-rust/walkdir-2*:= >=dev-rust/walkdir-2.2 )
"
BDEPEND="
	~dev-rust/zstd-safe-2.0.3:=
	bindgen? ( ${F_BINDGEN} )
	tokio? ( ${F_TOKIO} )
	test? (
		${F_BINDGEN}
		${F_TOKIO}
		${DEV_DEPEND}
	)
"
S="${WORKDIR}/${PN}-${MY_PV}"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
