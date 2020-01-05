# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="model-based testing for datastructures with linearizability checking"
HOMEPAGE="https://github.com/carllerche/tokio-mock-task"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/permutohedron-0.2*:=
	=dev-rust/proptest-0.8*:=[bit-set,fork,std,timeout]
"
PATCHES=(
	"${FILESDIR}/${P}-fix-macro.patch"
)
