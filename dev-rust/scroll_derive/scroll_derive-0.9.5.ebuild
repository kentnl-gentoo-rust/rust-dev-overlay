# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Derive Pread and Pwrite traits from the scroll crate"
HOMEPAGE="https://github.com/m4b/scroll_derive"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/proc-macro2-0.4*:=
	=dev-rust/quote-0.6*:=
	=dev-rust/syn-0.15*:=
	test? (
		=dev-rust/scroll-0.9*:=
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
