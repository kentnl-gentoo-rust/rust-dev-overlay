# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Flexible concrete Error type based on std::error::Error"
HOMEPAGE="https://github.com/dtolnay/anyhow"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	=dev-rust/rustversion-1*:=
	=dev-rust/thiserror-1*:=
	=dev-rust/trybuild-1*:=
"
BDEPEND="
	test? ( ${DEV_DEPEND} )
"
