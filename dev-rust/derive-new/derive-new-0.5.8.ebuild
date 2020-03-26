# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Derive simple constructor functions for structs and enums"
HOMEPAGE="https://github.com/nrc/derive-new"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=[printing,proc-macro]
"
src_test() {
	local targets=(
		# broken
		# ''
		'default'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
