# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Derive implementation for ref_cast::RefCast"
HOMEPAGE="https://github.com/dtolnay/ref-cast"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=
"
