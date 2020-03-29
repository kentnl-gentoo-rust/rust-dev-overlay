# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Environment variables utility functions"
HOMEPAGE="https://github.com/sagiegurari/envmnt"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/fsio-0.1*:=
	=dev-rust/indexmap-1*:=
"
src_prepare() {
	rm -vrf Makefile.toml benches/ docs/ examples/ || die
	default
}
