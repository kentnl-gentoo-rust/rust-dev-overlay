# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Safe, fast, small crypto using Rust"
HOMEPAGE="https://github.com/briansmith/ring"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ISC MIT openssl SSLeay"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.48 )
	( =dev-rust/untrusted-0.6*:= >=dev-rust/untrusted-0.6.2 )
	( =dev-rust/cc-1*:= >=dev-rust/cc-1.0.26 )
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.2 )
	=dev-rust/spin-0.5*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)

src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
