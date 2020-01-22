# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Detect when another future wants a result"
HOMEPAGE="https://github.com/seanmonstar/want"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/tokio-executor-0.2*:= >=dev-rust/tokio-executor-0.2.0_alpha2 )
	( =dev-rust/tokio-sync-0.2*:= >=dev-rust/tokio-sync-0.2.0_alpha2 )
"
BDEPEND="
	=dev-rust/log-0.4*:=
	=dev-rust/try-lock-0.2*:=
	test? ( ${DEV_DEPEND} )
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
