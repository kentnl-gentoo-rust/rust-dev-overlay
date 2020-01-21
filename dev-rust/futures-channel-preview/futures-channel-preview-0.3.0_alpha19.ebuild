# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Channels for async communication using 'futures'"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
MY_ALPHA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-alpha.${MY_ALPHA##alpha}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="sink test"
F_SINK="
	~dev-rust/futures-sink-preview-0.3.0_alpha19
"
BDEPEND="
	~dev-rust/futures-core-preview-0.3.0_alpha19
	sink? ( ${F_SINK} )
	test? ( ${F_SINK} )
"

S="${WORKDIR}/${PN}-${MY_PV}"
PATCHES=(
	"${FILESDIR}/${PN}-${MY_PV}-no-test-circularity.patch"
)
src_test() {
	# Doctests broken by https://github.com/rust-lang/futures-rs/issues/1017
	ecargo test --tests
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
