# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Sampling from random number distributions"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
DEV_DEPEND="
	( =dev-rust/average-0.10*:= >=dev-rust/average-0.10.3 )
	=dev-rust/rand_pcg-0.2*:=
"
BDEPEND="
	=dev-rust/rand-0.7*:=[std]
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
