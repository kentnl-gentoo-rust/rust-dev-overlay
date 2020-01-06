# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Atomically swappable Arc"
HOMEPAGE="https://github.com/vorner/arc-swap"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPENDS="
	=dev-rust/crossbeam-utils-0.6*:=[std]
	=dev-rust/itertools-0.8*:=
	=dev-rust/model-0.1*:=
	=dev-rust/num_cpus-1*:=
	=dev-rust/once_cell-1*:=
	=dev-rust/proptest-0.8*:=[bit-set,fork,std,timeout]
	=dev-rust/version-sync-0.8*:=
"
BDEPEND="
	test? ( ${DEV_DEPENDS} )
"
