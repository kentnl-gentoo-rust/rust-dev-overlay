# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="derives for the failure crate"
HOMEPAGE="https://github.com/withoutboats/failure_derive"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	( =dev-rust/syn-1*:= >=dev-rust/syn-1.0.3 )
	=dev-rust/synstructure-0.12*:=
	test? (
		=dev-rust/failure-0.1*:=
	)
"
