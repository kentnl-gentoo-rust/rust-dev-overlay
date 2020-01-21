# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Application-level tracing for Rust"
HOMEPAGE="https://github.com/tokio-rs/tracing"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="log +std test"
F_LOG="
	=dev-rust/log-0.4*:=
"
DEV_DEPEND="
	=dev-rust/futures-0.1*:=
	=dev-rust/log-0.4*:=
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.10 )
	( =dev-rust/tracing-attributes-0.1*:= >=dev-rust/tracing-attributes-0.1.6 )
	( =dev-rust/tracing-core-0.1*:=[std?] >=dev-rust/tracing-core-0.1.9 )
	log? ( ${F_LOG} )
	test? (
		=dev-rust/tracing-core-0.1*:=[std]
		${F_LOG}
		${DEV_DEPEND}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-benches.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
