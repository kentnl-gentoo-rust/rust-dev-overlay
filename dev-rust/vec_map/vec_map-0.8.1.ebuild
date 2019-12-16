# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Vector-based map for small integer keys"
HOMEPAGE="https://github.com/contain-rs/vec-map"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="eders test"
F_EDERS="
	=dev-rust/serde-1*:=[derive]
"
BDEPEND="
	eders? ( ${F_EDERS} )
	test? ( ${F_EDERS} )
"
