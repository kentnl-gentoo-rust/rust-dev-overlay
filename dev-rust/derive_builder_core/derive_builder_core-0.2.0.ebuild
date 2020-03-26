# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Internal helper library for the derive_builder crate"
HOMEPAGE="https://github.com/colin-kiegel/rust-derive-builder"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="logging test"
F_LOGGING="
	=dev-rust/log-0.3*:=
"
DEV_DEPEND="
	=dev-rust/pretty_assertions-0.2*:=
"
BDEPEND="
	=dev-rust/quote-0.3*:=
	=dev-rust/syn-0.11*:=[printing,parsing]
	logging? ( ${F_LOGGING} )
	test? (
		${DEV_DEPEND}
		${F_LOGGING}
	)
"
src_test() {
	local targets=(
		''
		'log'
		'logging'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
