# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Synchronization utilites"
HOMEPAGE="https://github.com/tokio-rs/tokio"
MY_ALPHA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-alpha.${MY_ALPHA##alpha}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="async-traits test"

F_ASYNC_TRAITS="
	~dev-rust/futures-sink-preview-0.3.0_alpha19:=
"
BDEPEND="
	( =dev-rust/fnv-1*:= >=dev-rust/fnv-1.0.6 )
	~dev-rust/futures-core-preview-0.3.0_alpha19:=
	~dev-rust/futures-util-preview-0.3.0_alpha19:=[std]
	async-traits? ( ${F_ASYNC_TRAITS} )
	test? ( ${F_ASYNC_TRAITS} )
"
PATCHES=(
	"${FILESDIR}/${PN}-${MY_PV}-broken-tests.patch"
)
S="${WORKDIR}/${PN}-${MY_PV}"
src_prepare() {
	rm -vrf benches/ || die
	default
}
src_test() {
	ecargo test --tests
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
