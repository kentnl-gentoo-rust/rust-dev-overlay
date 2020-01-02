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
	( =dev-rust/proc-macro2-0.4*:= >=dev-rust/proc-macro2-0.4.19 )
	( =dev-rust/quote-0.6*:= >=dev-rust/quote-0.6.8 )
	=dev-rust/syn-0.15*:=[printing,proc-macro]
	test? (
		=dev-rust/quickcheck-0.8*:=[regex,use-logging]
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
