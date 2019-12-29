# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Macros to generate types in the phf crate"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
# Tests break due to undeclared circular dep on phf
RESTRICT="test"
BDEPEND="
	( =dev-rust/phf_generator-0.7*:= >=dev-rust/phf_generator-0.7.24 )
	( =dev-rust/phf_shared-0.7*:= >=dev-rust/phf_shared-0.7.24 )
	=dev-rust/proc-macro2-0.4*:=
	=dev-rust/quote-0.6*:=
	=dev-rust/syn-0.15*:=[printing,proc-macro]
	test? (
		=dev-rust/compiletest_rs-0.3*:=
	)
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
