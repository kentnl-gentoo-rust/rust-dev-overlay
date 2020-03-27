# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A macro attribute for quickcheck"
HOMEPAGE="https://github.com/BurntSushi/quickcheck"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=[printing,proc-macro]
	test? (
		=dev-rust/quickcheck-0.9*:=[regex,use-logging]
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
