# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Native bindings to the libcurl library"
HOMEPAGE="https://github.com/alexcrichton/curl-rust"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="http2 mesalink +ssl static-ssl test"

F_HTTP2="
	=dev-rust/libnghttp2-sys-0.1*:=
"
# TODO: make sense of stupid '-cratesio' version suffix
# both in the package, and in its deps :|
F_MESALINK="
	(
		=dev-rust/mesalink-1*:=
		>=dev-rust/mesalink-1.1.0
	)
"
F_SSL="
	=dev-rust/openssl-sys-0.9*:=
"
F_STATIC_SSL="
	=dev-rust/openssl-sys-0.9*:=[vendored]
"

BDEPEND="
	=dev-rust/libc-0.2*:=
	( =dev-rust/libz-sys-1*:= >=dev-rust/libz-sys-1.0.18 )
	=dev-rust/cc-1*:=
	( =dev-rust/pkg-config-0.3*:= >=dev-rust/pkg-config-0.3.3 )
	http2? ( ${F_HTTP2} )
	mesalink? ( ${F_MESALINK} )
	ssl? ( ${F_SSL} )
	static-ssl? ( ${F_STATIC_SSL} )
	test? (
		${F_HTTP2}
		${F_MESALINK}
		${F_SSL}
		${F_STATIC_SSL}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
