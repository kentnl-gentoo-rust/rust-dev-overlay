# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A no-std, object-safe serialization framework"
HOMEPAGE="https://github.com/sval-rs/sval"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="arbitrary-depth derive serde test"
RESTRICT="test"
F_SERDE_LIB="
	=dev-rust/serde-1*:=
"
F_SMALLVEC="
	=dev-rust/smallvec-0.6*:=
"
F_SVAL_DERIVE="
	( =dev-rust/sval_derive-0.4*:= >=dev-rust/sval_derive-0.4.7 )
"

BDEPEND="
	arbitrary-depth? ( ${F_SMALLVEC} )
	derive? ( ${F_SVAL_DERIVE} )
	serde? ( ${F_SERDE_LIB} )
"
