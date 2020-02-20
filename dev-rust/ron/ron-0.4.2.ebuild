# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rusty Object Notation"
HOMEPAGE="https://github.com/ron-rs/ron"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/base64-0.10*:=
	=dev-rust/bitflags-1*:=
	=dev-rust/serde-1*:=[derive]
	test? (
		=dev-rust/serde_bytes-0.10*:=
		=dev-rust/serde_json-1*:=
	)
"
src_prepare() {
	# Pulls all deps
	rm -vrf examples/ || die
	default
}
