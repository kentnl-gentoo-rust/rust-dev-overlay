# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Generic serialization/deserialization support"
HOMEPAGE="https://github.com/rust-lang/rustc-serialize"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate
https://github.com/kentnl-rust/patches/releases/download/${P}-p0/${P}-p0.tar.xz
"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/rand-0.3*:=
	)
"
src_prepare() {
	eapply "${WORKDIR}/patches"
	default
}

src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
