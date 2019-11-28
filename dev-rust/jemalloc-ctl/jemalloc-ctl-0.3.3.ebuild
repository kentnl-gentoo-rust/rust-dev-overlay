# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="A safe wrapper over jemalloc's control and introspection APIs"
HOMEPAGE="https://github.com/gnzlbg/jemallocator"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/jemalloc-sys-0.3*:= >=dev-rust/jemalloc-sys-0.3.2 )
	=dev-rust/libc-0.2*:=
	=dev-rust/paste-0.1*:=
	test? (
		( =dev-rust/jemallocator-0.3*:= >=dev-rust/jemallocator-0.3.2 )
	)
"
