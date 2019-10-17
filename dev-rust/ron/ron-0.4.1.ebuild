# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rusty Object Notation"
HOMEPAGE="https://github.com/ron-rs/ron"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"
BDEPEND="
	=dev-rust/base64-0.10*:=
	=dev-rust/bitflags-1*:=
	=dev-rust/serde-1*:=[derive]
"
src_prepare() {
	# Pulls all deps
	rm -vrf examples/ || die
	default
}
