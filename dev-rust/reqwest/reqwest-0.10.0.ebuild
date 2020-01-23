# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Higher level HTTP client library"
HOMEPAGE="https://github.com/seanmonstar/reqwest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

IUSE="blocking cookies +default-tls gzip json native-tls native-tls-vendored rustls-tls"
F_BLOCKING="
	=dev-rust/futures-util-0.3*:=[io]
	=dev-rust/tokio-0.2*:=[rt-threaded,sync]
"
F_COOKIES="
	=dev-rust/cookie-0.12*:=
	=dev-rust/cookie_store-0.10*:=
"
F_DEFAULT_TLS="
	=dev-rust/hyper-tls-0.4*:=
	=dev-rust/native-tls-0.2*:=
	=dev-rust/tokio-tls-0.3*:=
"
F_GZIP="
	=dev-rust/async-compression-0.2*:=[gzip,stream]
"
F_JSON="
	=dev-rust/serde_json-1*:=
"
F_NATIVE_TLS="${F_DEFAULT_TLS}"
F_NATIVE_TLS_VENDORED="
	${F_NATIVE_TLS}
	=dev-rust/native-tls-0.2*:=[vendored]
"
F_RUSTLS_TLS="
	=dev-rust/hyper-rustls-0.19*:=[tokio-runtime]
	=dev-rust/tokio-rustls-0.12*:=
	=dev-rust/webpki-roots-0.17*:=
	=dev-rust/rustls-0.16*:=[logging]
"
DEV_DEPEND="
	=dev-rust/doc-comment-0.3*:=
	=dev-rust/env_logger-0.6*:=[atty,humantime,regex,termcolor]
	=dev-rust/hyper-0.13*:=[tcp]
	=dev-rust/libflate-0.1*:=
	=dev-rust/serde-1*:=[derive]
	=dev-rust/tokio-0.2*:=[macros]
"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	=dev-rust/http-0.2*:=
	( =dev-rust/url-2*:= >=dev-rust/url-2.1 )
	=dev-rust/base64-0.11*:=
	=dev-rust/encoding_rs-0.8*:=
	=dev-rust/futures-core-0.3*:=
	=dev-rust/futures-util-0.3*:=
	=dev-rust/http-body-0.3*:=
	=dev-rust/hyper-0.13*:=[tcp]
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.4 )
	=dev-rust/log-0.4*:=
	( =dev-rust/mime-0.3*:= >=dev-rust/mime-0.3.7 )
	=dev-rust/mime_guess-2*:=
	( =dev-rust/percent-encoding-2*:= >=dev-rust/percent-encoding-2.1 )
	( =dev-rust/pin-project-lite-0.1*:= >=dev-rust/pin-project-lite-0.1.1 )
	=dev-rust/serde-1*:=
	( =dev-rust/serde_urlencoded-0.6*:= >=dev-rust/serde_urlencoded-0.6.1 )
	( =dev-rust/time-0.1*:= >=dev-rust/time-0.1.42 )
	=dev-rust/tokio-0.2*:=[tcp,time]
	blocking? ( ${F_BLOCKING} )
	cookies? ( ${F_COOKIES} )
	default-tls? ( ${F_DEFAULT_TLS} )
	gzip? ( ${F_GZIP} )
	json? ( ${F_JSON} )
	native-tls? ( ${F_NATIVE_TLS} )
	native-tls-vendored? ( ${F_NATIVE_TLS_VENDORED} )
	rustls-tls? ( ${F_RUSTLS_TLS} )
	test? (
		${DEV_DEPEND}
		${F_BLOCKING}
		${F_COOKIES}
		${F_DEFAULT_TLS}
		${F_GZIP}
		${F_JSON}
		${F_NATIVE_TLS}
		${F_NATIVE_TLS_VENDORED}
		${F_RUSTLS_TLS}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -vrf examples || die
	rm -vf tests/badssl.rs || die
	default
}
