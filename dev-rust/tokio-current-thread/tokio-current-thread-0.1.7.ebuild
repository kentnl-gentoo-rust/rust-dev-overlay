# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Single threaded executor for mulitple concurrent tasks on the current thread"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.7 )
"
