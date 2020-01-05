# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Mock a Tokio task"
HOMEPAGE="https://github.com/carllerche/tokio-mock-task"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.21 )
"
