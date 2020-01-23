# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Detect MIME type by file extension"
HOMEPAGE="https://github.com/abonander/mime_guess"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/mime-0.3*:=
	( =dev-rust/unicase-2*:= >=dev-rust/unicase-2.4.0 )
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench-examples.patch"
)
src_prepare() {
	rm -vrf benches/ examples/ || die
	default
}
