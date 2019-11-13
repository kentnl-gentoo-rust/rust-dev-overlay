# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Demangle C++ symbols"
HOMEPAGE="https://github.com/gimli-rs/cpp_demangle"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.9 )
	=dev-rust/glob-0.3*:=
"
src_prepare() {
	eapply "${FILESDIR}/${P}-nobins.patch"
	rm -vf "examples/cppfilt.rs" "src/bin/afl_runner.rs" || die
	default
}
