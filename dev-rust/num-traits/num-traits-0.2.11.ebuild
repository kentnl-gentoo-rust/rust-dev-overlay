# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Numeric traits for generic mathematics"
HOMEPAGE="https://github.com/rust-num/num-traits"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="libm test"

F_LIBM="
	=dev-rust/libm-0.2*:=
"
BDEPEND="
	=dev-rust/autocfg-1*:=
	libm? ( ${F_LIBM} )
	test? ( ${F_LIBM} )
"
src_test() {
	ecargo test --features="$(usev libm)"
}
