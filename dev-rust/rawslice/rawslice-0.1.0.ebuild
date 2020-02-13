# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Reimplementation of the slice iterators, with extra features"
HOMEPAGE="https://github.com/bluss/rawslice"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/quickcheck-0.4*:=
"
BDEPEND="
	=dev-rust/rawpointer-0.1*:=
	test? ( ${DEV_DEPEND} )
"
