# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A case insensitive wrapper around strings"
HOMEPAGE="https://github.com/seanmonstar/unicase"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/version_check-0.1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-no-heapsize.patch"
)
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
