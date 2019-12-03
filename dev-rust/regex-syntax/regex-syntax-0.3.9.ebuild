# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A regular expression parser"
HOMEPAGE="https://github.com/rust-lang/regex"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/quickcheck-0.2*:=
		=dev-rust/rand-0.3*:=
	)
"
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
