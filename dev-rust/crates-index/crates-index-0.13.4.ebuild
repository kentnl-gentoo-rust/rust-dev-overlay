# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Retrieve and interact with the crates.io index"
HOMEPAGE="https://github.com/frewsxcv/rust-crates-index"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/tempdir-0.3*:= >=dev-rust/tempdir-0.3.7 )
"
BDEPEND="
	=dev-rust/error-chain-0.12*:=[backtrace]
	=dev-rust/git2-0.11*:=[https,ssh]
	=dev-rust/glob-0.3*:=
	=dev-rust/home-0.5*:=
	=dev-rust/serde-1*:=
	=dev-rust/serde_derive-1*:=
	=dev-rust/serde_json-1*:=
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-network-tests.patch"
)
