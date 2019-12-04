# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Lightweight non-blocking IO"
HOMEPAGE="https://github.com/carllerche/mio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.9 )
	( =dev-rust/iovec-0.1*:= >=dev-rust/iovec-0.1.1 )
	=dev-rust/log-0.4*:=
	( =dev-rust/net2-0.2*:= >=dev-rust/net2-0.2.29 )
	=dev-rust/slab-0.4*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
