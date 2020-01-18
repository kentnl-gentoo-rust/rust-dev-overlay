# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Testing utils for Tokio- and futures based code"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

IUSE="test"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	=dev-rust/futures-core-0.3*:=
	=dev-rust/tokio-0.2*:=[sync,time]
	test? (
		=dev-rust/futures-util-0.3*:=[async-await-macro,std]
		=dev-rust/tokio-0.2*:=[full]
	)
"
