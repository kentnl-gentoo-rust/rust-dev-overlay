# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A framework for Rust wrappers over C APIs"
HOMEPAGE="https://github.com/sfackler/foreign-types"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/foreign-types-macros-0.2*:=
	=dev-rust/foreign-types-shared-0.3*:=
"
