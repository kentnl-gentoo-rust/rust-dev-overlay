# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A C expression parser and evaluator"
HOMEPAGE="https://github.com/jethrogb/rust-cexpr"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/nom-4*:=
	test? (
		( >=dev-rust/clang-sys-0.13.0:= <dev-rust/clang-sys-0.29.0 )
	)
"
