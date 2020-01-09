# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="derive(Error)"
HOMEPAGE="https://github.com/dtolnay/thiserror"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/anyhow-1*:=
	=dev-rust/ref-cast-1*:=
	=dev-rust/rustversion-1*:=
	=dev-rust/trybuild-1*:=
"
BDEPEND="
	~dev-rust/thiserror-impl-1.0.6:=
	test? ( ${DEV_DEPEND} )
"
