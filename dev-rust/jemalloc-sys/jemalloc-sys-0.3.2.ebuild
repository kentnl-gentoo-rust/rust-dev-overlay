# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="FFI bindings to jemalloc"
HOMEPAGE="https://github.com/gnzlbg/jemallocator"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.8 )
	( =dev-rust/cc-1*:= >=dev-rust/cc-1.0.13 )
	( =dev-rust/fs_extra-1*:= >=dev-rust/fs_extra-1.1 )
"
