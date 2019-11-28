# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="encodes or decodes bas64 as bytes or utf8"
HOMEPAGE="https://github.com/alicemaz/rust-base64"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.1.0 )
	=dev-rust/safemem-0.3*:=
	test? (
		=dev-rust/rand-0.4*:=[std]
	)
"
src_prepare() {
	# needs criterion
	rm -vrf benches/ || die
	# Causes optional deps pulled in
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
