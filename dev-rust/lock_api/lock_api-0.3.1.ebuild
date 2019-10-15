# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="no_std-compatible wrappers to create Mutex and RwLock types"
HOMEPAGE="https://github.com/Amanieu/parking_lot"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"
F_OWNING_REF="
	=dev-rust/owning_ref-0.4*:=
"
F_SERDE="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.90 )
"
BDEPEND="
	=dev-rust/scopeguard-1*:=
"
