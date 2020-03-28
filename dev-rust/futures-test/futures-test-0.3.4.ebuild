# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Common utilities for testing components based off 'futures'"
HOMEPAGE="https://github.com/rust-lang/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"
BDEPEND="
	( =dev-rust/futures-core-0.3*:= >=dev-rust/futures-core-0.3.4 )
	( =dev-rust/futures-executor-0.3*:=[std?] >=dev-rust/futures-executor-0.3.4 )
	( =dev-rust/futures-io-0.3*:= >=dev-rust/futures-io-0.3.4 )
	( =dev-rust/futures-task-0.3*:= >=dev-rust/futures-task-0.3.4 )
	( =dev-rust/futures-util-0.3*:=[std?] >=dev-rust/futures-util-0.3.4 )
	( =dev-rust/pin-utils-0.1*:= >=dev-rust/futures-util-0.1.0_alpha4 )
	std? ( =dev-rust/futures-util-0.3*:=[io] )
	test? (
		=dev-rust/futures-executor-0.3*:=[std]
		=dev-rust/futures-util-0.3*:=[std,io]
	)
"
src_test() {
	# doctests fail
	ecargo test --lib --tests
}
