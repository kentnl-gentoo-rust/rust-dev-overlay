# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Macros 1.1 implementation of #[derive(Serialize, Deserialize)]"
HOMEPAGE="https://serde.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/proc-macro2-0.4*:=
	( =dev-rust/quote-0.6*:= >=dev-rust/quote-0.6.3 )
	( =dev-rust/syn-0.15*:= >=dev-rust/syn-0.15.22 )
	test? (
		=dev-rust/serde-1*:=
	)
"
