# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Automatically derive a Deref/DerefMut implementation"
HOMEPAGE="https://github.com/dac-gmbh/derefable"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/proc-macro2-0.4*:= >=dev-rust/proc-macro2-0.4.26 )
	=dev-rust/quote-0.6*:=
	=dev-rust/syn-0.15*:=[printing,proc-macro]
"
