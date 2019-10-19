# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Sum-type Enum with Left and Right general purpose variants"
HOMEPAGE="https://github.com/bluss/either"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde test"

F_SERDE="
	=dev-rust/serde-1*:=[derive]
"

BDEPEND="
	serde? ( ${F_SERDE} )
	test? ( ${F_SERDE} )
"
