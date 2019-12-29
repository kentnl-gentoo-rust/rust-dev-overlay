# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Platform-specific standard locations of directories"
HOMEPAGE="https://github.com/soc/dirs-sys"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/cfg-if-0.1*:=
	( =dev-rust/dirs-sys-0.3*:= >=dev-rust/dirs-sys-0.3.4 )
"
src_prepare() {
	rm -vrf .appveyor.yml .travis.yml || die
	default
}
