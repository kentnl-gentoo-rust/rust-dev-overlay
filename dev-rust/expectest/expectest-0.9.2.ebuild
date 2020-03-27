# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Matchers and matcher functions for unit testing"
HOMEPAGE="https://github.com/zummenix/expectest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/num-traits-0.1*:= >=dev-rust/num-traits-0.1.40 )
"
src_prepare() {
	rm -vrf ci/ || die
	default
}
