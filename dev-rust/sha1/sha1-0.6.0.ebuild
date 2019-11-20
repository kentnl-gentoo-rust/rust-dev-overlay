# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Minimal SHA1 implementation for Rust"
HOMEPAGE="https://github.com/mitsuhiko/rust-sha1"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="serde"
RESTRICT="test"

F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	serde? ( ${F_SERDE} )
"
