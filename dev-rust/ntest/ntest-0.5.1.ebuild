# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Testing framework for rust that extends the built-in library"
HOMEPAGE="https://github.com/becheran/ntest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/ntest_test_cases-0.5*:= >=dev-rust/ntest_test_cases-0.5.1 )
	( =dev-rust/ntest_timeout-0.5*:=    >=dev-rust/ntest_timeout-0.5.1 )
"
