# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Experimental computation of basic stats on streams"
HOMEPAGE="https://github.com/BurntSushi/rust-stats"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/num-traits-0.2*:=
"
src_prepare() {
	rm -vrf session.vim Makefile || die
	default
}
