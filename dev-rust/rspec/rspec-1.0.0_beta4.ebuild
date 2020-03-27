# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Write Rspec-like tests with stable rust"
HOMEPAGE="https://github.com/mackwic/rspec"
MY_BETA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-beta.${MY_BETA##beta}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="MPL-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="expectest-compat test"
F_EXPECTEST="
	( =dev-rust/expectest-0.9*:= >=dev-rust/expectest-0.9.1 )
"
BDEPEND="
	( =dev-rust/colored-1*:= >=dev-rust/colored-1.4.0 )
	=dev-rust/derive-new-0.5*:=
	=dev-rust/derive_builder-0.5*:=
	( =dev-rust/rayon-0.8*:= >=dev-rust/rayon-0.8.2 )
	expectest-compat? ( ${F_EXPECTEST} )
	test? (
		${F_EXPECTEST}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-clippy.patch"
)
S="${WORKDIR}/${PN}-${MY_PV}"
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
src_test() {
	local targets=(
		''
		'expectest'

		'default'
		'expectest_compat'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --all-features
}
