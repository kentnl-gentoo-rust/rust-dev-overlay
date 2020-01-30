# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
ECRATE_VERSION="${PV}-cratesio"
DESCRIPTION="Memory-safe OpenSSL-compatible TLS library based on Rustls and Ring"
HOMEPAGE="https://github.com/alexcrichton/openssl-src-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${ECRATE_VERSION}/download -> ${PN}-${ECRATE_VERSION}.crate"

LICENSE="BSD ISC"
KEYWORDS="~amd64 ~x86"
IUSE="jemalloc-allocator"
F_JEMALLOC_ALLOCATOR="
	=dev-rust/jemallocator-0.3*:=
"
BDEPEND="
	=dev-rust/base64-0.10*:=
	=dev-rust/bitflags-1*:=
	=dev-rust/enum_to_u8_slice_derive-0.1*:=
	=dev-rust/env_logger-0.6*:=[atty,humantime,regex,termcolor]
	=dev-rust/lazy_static-1*:=
	=dev-rust/libc-0.2*:=
	=dev-rust/parking_lot-0.9*:=
	=dev-rust/ring-0.16*:=[dev-urandom-fallback]
	=dev-rust/rustls-0.16*:=[logging]
	=dev-rust/sct-0.6*:=
	=dev-rust/untrusted-0.7*:=
	=dev-rust/webpki-0.21*:=
	=dev-rust/webpki-roots-0.17*:=
	=dev-rust/walkdir-2*:=
	jemalloc-allocator? ( ${F_JEMALLOC_ALLOCATOR} )
	test? (
		${F_JEMALLOC_ALLOCATOR}
		=dev-rust/log-0.4*:=
	)
"
S="${WORKDIR}/${PN}-${ECRATE_VERSION}"
PATCHES=(
	"${FILESDIR}/${P}-no-cargo-examples.patch"
	"${FILESDIR}/${P}-no-network-tests.patch"
)
src_prepare() {
	rm -rvf examples/ || die
	default
}
src_install() {
	rust-crate_install "${PN}" "${ECRATE_VERSION}"
}
