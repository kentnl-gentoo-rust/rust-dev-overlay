# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Retrieve and interact with the crates.io index"
HOMEPAGE="https://github.com/frewsxcv/rust-crates-index"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/git2-0.6*:=
	( =dev-rust/glob-0.2*:= >=dev-rust/glob-0.2.10 )
	( =dev-rust/rustc-serialize-0.3*:= >=dev-rust/rustc-serialize-0.3.14 )
"
PATCHES=(
	"${FILESDIR}/${P}-network-tests.patch"
)
