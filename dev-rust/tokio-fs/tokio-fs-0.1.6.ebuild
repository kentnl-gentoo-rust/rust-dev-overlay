# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Filesystem API for tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
DEV_DEPEND="
	=dev-rust/rand-0.6*:=
	=dev-rust/tempdir-0.3*:=
	=dev-rust/tempfile-3*:=
	( =dev-rust/tokio-0.1*:= >=dev-rust/tokio-0.1.7 )
"
BDEPEND="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.21 )
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.6 )
	( =dev-rust/tokio-threadpool-0.1*:= >=dev-rust/tokio-threadpool-0.1.3 )
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
