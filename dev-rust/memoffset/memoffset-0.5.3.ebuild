# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="offset_of functionality for Rust structs"
HOMEPAGE="https://github.com/Gilnaa/memoffset"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPEND="
	=dev-rust/doc-comment-0.3*:=
"
BDEPEND="
	( =dev-rust/rustc_version-0.2*:= >=dev-rust/rustc_version-0.2.3 )
	test? ( ${DEV_DEPEND} )
"
src_prepare() {
	rm -vrf ci/ || die
	default
}
