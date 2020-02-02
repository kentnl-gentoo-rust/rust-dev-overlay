# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core random number generator traits and implementation tools"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="log test"

F_LOG="
	=dev-rust/log-0.4*:=
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.2 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.64 )
	log? ( ${F_LOG} )
	test? ( ${F_LOG} )
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
