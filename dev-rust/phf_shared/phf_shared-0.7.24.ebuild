# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Support code shared by PHF libraries"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="unicase test"

F_UNICASE="
	=dev-rust/unicase-1.4*:=
"
BDEPEND="
	=dev-rust/siphasher-0.2*:=
	unicase? ( ${F_UNICASE} )
	test? ( ${F_UNICASE} )
"
