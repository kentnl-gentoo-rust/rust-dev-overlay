# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="String interning for Rust"
HOMEPAGE="https://github.com/servo/string-cache"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/lazy_static-1*:=
	=dev-rust/new_debug_unreachable-1*:=
	( =dev-rust/phf_shared-0.7*:= >=dev-rust/phf_shared-0.7.4 )
	=dev-rust/precomputed-hash-0.1*:=
	=dev-rust/serde-1*:=
	=dev-rust/string_cache_shared-0.3*:=
	=dev-rust/string_cache_codegen-0.4*:=
	test? (
		=dev-rust/rand-0.4*:=[std]
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
