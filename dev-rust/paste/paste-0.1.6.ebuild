# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Macros for all your token pasting needs"
HOMEPAGE="https://github.com/dtolnay/paste"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	~dev-rust/paste-impl-0.1.6:=
	=dev-rust/proc-macro-hack-0.5*:=
"
