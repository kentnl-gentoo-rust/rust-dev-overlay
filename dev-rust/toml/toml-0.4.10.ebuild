# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Native rust encoder/decoder of TOML files and streams"
HOMEPAGE="https://github.com/alexcrichton/toml-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/serde-1*:=
	test? (
		=dev-rust/serde_derive-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
