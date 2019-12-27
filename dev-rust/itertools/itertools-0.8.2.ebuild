# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Extra iterator adaptors, methods, free functions and macros"
HOMEPAGE="https://github.com/bluss/rust-itertools"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/either-1*:=
	test? (
		=dev-rust/permutohedron-0.2*:=
		=dev-rust/quickcheck-0.7*:=
		=dev-rust/rand-0.6*:=[std]
	)
"
src_prepare() {
	rm -rvf benches/ || die
	rm -rvf examples/ || die
	default
}
