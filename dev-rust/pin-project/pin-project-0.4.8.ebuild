# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A crate for safe and erconomic pin-projection"
HOMEPAGE="https://github.com/taiki-e/pin-project"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	~dev-rust/pin-project-internal-0.4.8:=
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	rm -vrf ci/ \
		examples/ \
		ci.sh \
		compiletest.sh || die
	default
}
