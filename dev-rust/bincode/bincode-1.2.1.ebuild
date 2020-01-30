# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Binary serialization/deserialization via serde"
HOMEPAGE="https://github.com/servo/bincode"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.3 )
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.63 )
	test? (
		=dev-rust/serde_bytes-0.11*:=
		( =dev-rust/serde_derive-1*:= >=dev-rust/serde_derive-1.0.27 )
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
