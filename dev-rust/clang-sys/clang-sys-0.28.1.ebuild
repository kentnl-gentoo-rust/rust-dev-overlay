# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rust bindings for libclang"
HOMEPAGE="https://github.com/KyleMayes/clang-sys"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="runtime test"
F_RUNTIME="
	=dev-rust/libloading-0.5*:=
"
BDEPEND="
	=dev-rust/glob-0.3*:=
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.39 )
	runtime? ( ${F_RUNTIME} )
	test? ( ${F_RUNTIME} )
"
src_prepare() {
	rm -vrf ci clippy.toml appveyor.yml .travis.yml || die
	default
}
