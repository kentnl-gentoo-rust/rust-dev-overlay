# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An RSpec inspired minimal testing framework"
HOMEPAGE="https://github.com/utkarshkukreti/speculate.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/proc-macro2-0.4*:=
	=dev-rust/quote-0.6*:=
	=dev-rust/syn-0.14*:=[printing,proc-macro]
	=dev-rust/unicode-xid-0.1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-broken-doctest.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
