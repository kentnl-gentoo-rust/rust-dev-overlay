# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Enable custom derive attributes"
HOMEPAGE="https://github.com/DanielKeep/rust-custom-derive"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		( =dev-rust/rustc-serialize-0.3*:= >=dev-rust/rustc-serialize-0.3.15 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-modern-cargo.patch"
)
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
