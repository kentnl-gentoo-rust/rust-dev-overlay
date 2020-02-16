# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="OpenSSL bindings"
HOMEPAGE="https://github.com/sfackler/rust-openssl"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="vendored test"

BDEPEND="
	=dev-rust/bitflags-1*:=
	=dev-rust/cfg-if-0.1*:=
	( =dev-rust/foreign-types-0.3*:= >=dev-rust/foreign-types-0.3.1 )
	=dev-rust/lazy_static-1*:=
	=dev-rust/libc-0.2*:=
	( =dev-rust/openssl-sys-0.9*:=[vendored?] >=dev-rust/openssl-sys-0.9.54 )
	test? (
		=dev-rust/hex-0.3*:=
		=dev-rust/tempdir-0.3*:=
		=dev-rust/openssl-sys-0.9*:=[vendored]
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	local targets=(
		''
		'v101'
		'v102'
		'v110'
		'v111'
		'vendored'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
