# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Fork of enum_to_str_derive, convert enum to u8 slice ref"
HOMEPAGE="https://github.com/mesalock-linux/enum_to_u8_slice_derive"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/quote-0.3*:= >=dev-rust/quote-0.3.15 )
	( =dev-rust/syn-0.11*:= >=dev-rust/syn-0.11.11 )
"
