# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Generate and parse UUIDs"
HOMEPAGE="https://github.com/uuid-rs/uuid"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde slog test v3 v4 v5"

F_MD5="
	=dev-rust/md5-0.6*:=
"
F_RAND="
	=dev-rust/rand-0.7*:=[std]
"
F_SERDE="
	( =dev-rust/serde-1*:=[derive] >=dev-rust/serde-1.0.56 )
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
	slog? ( ${F_SLOG} )
	v3? ( ${F_V3} )
	v4? ( ${F_V4} )
	v5? ( ${F_V5} )
	test? (
		=dev-rust/bincode-1*:=
		( =dev-rust/serde_derive-1*:= >=dev-rust/serde_derive-1.0.79 )
		=dev-rust/serde_json-1*:=
		( =dev-rust/serde_test-1*:= >=dev-rust/serde_test-1.0.56 )
		${F_MD5}
		${F_RAND}
		${F_SERDE}
		${F_SHA1}
		${F_SLOG}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-cargo.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
