# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Concurrent work-stealing deque"
HOMEPAGE="https://github.com/crossbeam-rs/crossbeam"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/crossbeam-epoch-0.8*:=[std]
	=dev-rust/crossbeam-utils-0.7*:=[std]
	test? (
		=dev-rust/rand-0.6*:=[std]
	)
"
