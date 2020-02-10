# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Macro to require a compiler prove a function can't panic"
HOMEPAGE="https://github.com/dtolnay/ryu"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/tempfile-3*:=
"
BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=[printing,proc-macro]
	test? ( ${DEV_DEPEND} )
"
src_test() {
	ecargo test --lib
	ecargo test --doc
	# https://github.com/gyakovlev/rust-dev-overlay/issues/5
	# ecargo test --tests
}
