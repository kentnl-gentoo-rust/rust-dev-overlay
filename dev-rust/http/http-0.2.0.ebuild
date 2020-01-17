# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Types for HTTP requests and responses"
HOMEPAGE="https://github.com/hyperium/http"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/doc-comment-0.3*:=
	=dev-rust/indexmap-1*:=
	=dev-rust/quickcheck-0.9*:=[regex,use-logging]
	=dev-rust/rand-0.7*:=[std]
	( =dev-rust/seahash-3*:= >=dev-rust/seahash-3.0.5 )
	=dev-rust/serde-1*:=
	=dev-rust/serde_json-1*:=
"
BDEPEND="
	=dev-rust/bytes-0.5*:=
	( =dev-rust/fnv-1*:= >=dev-rust/fnv-1.0.5 )
	( =dev-rust/itoa-0.4*:= >=dev-rust/itoa-0.4.1 )
	test? (
		${DEV_DEPEND}
	)
"

src_prepare() {
	rm -vrf benches || die
	default
}
