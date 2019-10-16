# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="More compact and efficient implementations of standard sync primatives"
HOMEPAGE="https://github.com/Amanieu/parking_lot"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
BDEPEND="
	( =dev-rust/lock_api-0.3*:= >=dev-rust/lock_api-0.3.1 )
	=dev-rust/parking_lot_core-0.6*:=
	=dev-rust/rustc_version-0.2*:=
"
