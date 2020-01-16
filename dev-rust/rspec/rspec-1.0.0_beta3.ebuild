# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Write Rspec-like tests with stable rust"
HOMEPAGE="https://github.com/mackwic/rspec"
MY_BETA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-beta.${MY_BETA##beta}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="MPL-2.0"
KEYWORDS="~amd64 ~x86"

PATCHES=(
	"${FILESDIR}/${P}-no-clippy.patch"
)
S="${WORKDIR}/${PN}-${MY_PV}"
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
