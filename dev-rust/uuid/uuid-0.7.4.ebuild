# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Generate and parse UUIDs"
HOMEPAGE="https://github.com/dtolnay/serde-yaml"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde v4"
RESTRICT="test"
F_BYTEORDER="
	=dev-rust/byteorder-1*:=
"
F_MD5="
	=dev-rust/md5-0.6*:=
"
F_RAND="
	=dev-rust/rand-0.6*:=
"
F_SERDE="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.56 )
"
F_SHA1="
	=dev-rust/sha1-0.6*:=
"
F_SLOG="
	=dev-rust/slog-2*:=
"
F_V3="${F_MD5}"
F_V4="${F_RAND}"
F_V5="${F_SHA1}"
BDEPEND="
	serde? ( ${F_SERDE} )
	v4? ( ${F_V4} )
"
