# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Native bindings to the libgit2 library"
HOMEPAGE="https://github.com/rust-lang/git2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="https ssh"

F_LIBSSH2_SYS="
	( =dev-rust/libssh2-sys-0.2*:= >=dev-rust/libssh2-sys-0.2.11 )
"
F_OPENSSL_SYS="
	=dev-rust/openssl-sys-0.9*:=
"
BDEPEND="
	=dev-rust/libc-0.2*:=
	( =dev-rust/libz-sys-1*:= >=dev-rust/libz-sys-1.0.22 )
	( =dev-rust/cc-1*:=[parallel] >=dev-rust/cc-1.0.42 )
	( =dev-rust/pkg-config-0.3*:= >=dev-rust/pkg-config-0.3.7 )
	https? ( ${F_OPENSSL_SYS} )
	ssh? ( ${F_LIBSSH2_SYS} )
	test? (
		${F_OPENSSL_SYS}
		${F_LIBSSH2_SYS}
	)
"
src_prepare() {
	rm -vrf libgit2/azure-pipelines/ \
			libgit2/azure-pipelines.yml \
			libgit2/docs/ \
			libgit2/examples/ \
			libgit2/script/ \
			libgit2/cmake/ \
			libgit2/fuzzers/ \
			CMakeLists.txt || die
	default
}
