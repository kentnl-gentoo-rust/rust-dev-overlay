# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Cross-platform rust equivalent of unix 'which'"
HOMEPAGE="https://github.com/harryfei/which-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+failure test"
F_FAILURE="
	( =dev-rust/failure-0.1*:=[std] >=dev-rust/failure-0.1.6 )
"
DEV_DEPEND="
	( =dev-rust/tempdir-0.3*:= >=dev-rust/tempdir-0.3.7 )
"
BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.65 )
	failure? ( ${F_FAILURE} )
	test? (
		${DEV_DEPEND}
		${F_FAILURE}
	)
"
