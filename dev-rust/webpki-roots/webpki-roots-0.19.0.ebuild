# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Mozilla CA root certificats for use with webpki"
HOMEPAGE="https://github.com/ctz/webpki-roots"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MPL-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/webpki-0.21*:=
"
src_prepare() {
	rm -vrf src/bin {build,extra_constraints}.py || die
	default
}
