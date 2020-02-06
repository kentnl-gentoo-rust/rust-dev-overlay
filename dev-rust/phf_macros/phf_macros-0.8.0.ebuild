# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Macros to generate types in the phf crate"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/phf-0.8*:=[macros,unicase]
	=dev-rust/trybuild-1*:=
	( =dev-rust/unicase-2*:= >=dev-rust/unicase-2.4.0 )
"
BDEPEND="
	=dev-rust/phf_generator-0.8*:=
	=dev-rust/phf_shared-0.8*:=
	( =dev-rust/proc-macro-hack-0.5*:= >=dev-rust/proc-macro-hack-0.5.4 )
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=[printing,proc-macro]
	test? ( ${DEV_DEPEND} )
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
