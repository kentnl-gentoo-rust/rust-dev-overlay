# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

MY_PV="${PV}+zstd.1.4.4"
DESCRIPTION="Safe Low-level bindings for the zstd compression library"
HOMEPAGE="https://github.com/gyscos/zstd-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="bindgen"

BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.21 )
	~dev-rust/zstd-sys-1.4.15:=[bindgen?]
	test? (
		~dev-rust/zstd-sys-1.4.15:=[bindgen]
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
