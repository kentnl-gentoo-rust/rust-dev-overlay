# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Async wake signals"
HOMEPAGE="https://github.com/csherratt/pulse"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/atom-0.3*:=
	=dev-rust/time-0.1*:=
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
