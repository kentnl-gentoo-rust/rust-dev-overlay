# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="encodes or decodes bas64 as bytes or utf8"
HOMEPAGE="https://github.com/alicemaz/rust-base64"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.2.6 )
"
RESTRICT="test"
src_prepare() {
	# Causes optional deps pulled in
	rm -vrf examples/ || die
	# Unneeded
	rm -v icon_CLion.svg || die
	default
}
