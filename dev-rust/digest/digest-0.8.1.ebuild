# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Traits for cryptographic hash functions"
HOMEPAGE="https://github.com/RustCrypto/traits"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="dev test"
F_DEV="
	=dev-rust/blobby-0.1*:=
"
BDEPEND="
	dev? ( ${F_DEV} )
	=dev-rust/generic-array-0.12*:=
	test? ( ${F_DEV} )
"
src_test() {
	ecargo test --release --features=dev
}
