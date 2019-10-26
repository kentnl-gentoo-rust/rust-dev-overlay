# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Native bindings to the libgit2 library"
HOMEPAGE="https://github.com/alexcrichton/git2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="curl https ssh"

F_CURL_SYS="
	=dev-rust/curl-sys-0.4*:=
"
F_LIBSSH2_SYS="
	( =dev-rust/libssh2-sys-0.2*:= >=dev-rust/libssh2-sys-0.2.4 )
"
F_OPENSSL_SYS="
	=dev-rust/openssl-sys-0.9*:=
"
BDEPEND="
	=dev-rust/libc-0.2*:=
	dev-rust/libz-sys:=
	=dev-rust/cc-1*:=
	( =dev-rust/cmake-0.1*:= >=dev-rust/cmake-0.1.2 )
	=dev-rust/pkg-config-0.3*:=
	curl? ( ${F_CURL_SYS} )
	https? ( ${F_OPENSSL_SYS} )
	ssh? ( ${F_LIBSSH2_SYS} )
	test? (
		${F_CURL_SYS}
		${F_OPENSSL_SYS}
		${F_LIBSSH2_SYS}
	)
"
