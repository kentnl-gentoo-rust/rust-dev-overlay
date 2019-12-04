# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="RFC 1158 extensions to standard library networking types"
HOMEPAGE="https://github.com/rust-lang-nursery/net2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/cfg-if-0.1*:=
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.42 )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
