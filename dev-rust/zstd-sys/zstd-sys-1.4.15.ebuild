# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

MY_PV="1.4.15+zstd.1.4.4"
DESCRIPTION="Low-level bindings for the zstd compression library"
HOMEPAGE="https://github.com/gyscos/zstd-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="bindgen pkg-config"

F_BINDGEN="
	=dev-rust/bindgen-0.51*:=[logging,which-rustfmt]
"
F_PKG_CONFIG="
	=dev-rust/pkg-config-0.3*:=
"
BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.45 )
	bindgen? ( ${F_BINDGEN} )
	( =dev-rust/cc-1*:=[parallel] >=dev-rust/cc-1.0.45 )
	=dev-rust/glob-0.3*:=
	pkg-config? ( ${F_PKG_CONFIG} )
	test? (
		${F_BINDGEN}
		${F_PKG_CONFIG}
	)
"

S="${WORKDIR}/${PN}-${MY_PV}"
src_prepare() {
	rm -vrf zstd/examples zstd/contrib zstd/doc zstd/tests zstd/programs || die
	default
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
src_test() {
	ecargo test --all-features
}
