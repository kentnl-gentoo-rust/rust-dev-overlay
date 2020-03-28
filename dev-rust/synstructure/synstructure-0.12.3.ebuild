# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Helper methods and macros for custom derives"
HOMEPAGE="https://github.com/mystor/synstructure"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+proc-macro test"

F_PROC_MACRO="
	=dev-rust/syn-1*:=[proc-macro]
"
BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=
	=dev-rust/unicode-xid-0.2*:=
	proc-macro? ( ${F_PROC_MACRO} )
	test? (
		${F_PROC_MACRO}
		=dev-rust/synstructure_test_traits-0.1*:=
	)
"
src_test() {
	local targets=(
		''

		'default'
		'proc-macro'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
