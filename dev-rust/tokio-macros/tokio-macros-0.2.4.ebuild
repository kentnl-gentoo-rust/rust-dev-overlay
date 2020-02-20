# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Tokio's proc macros"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

IUSE="test"
BDEPEND="
	( =dev-rust/proc-macro2-1*:= >=dev-rust/proc-macro2-1.0.7 )
	=dev-rust/quote-1*:=
	( =dev-rust/syn-1*:=[printing,proc-macro] >=dev-rust/syn-1.0.3 )
	test? (
		=dev-rust/tokio-0.2*:=[full]
	)
"
