# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A timeout mechanism for unit tests"
HOMEPAGE="https://github.com/csherratt/timebomb"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/pulse-0.5*:=
"
PATCHES=(
	"${FILESDIR}/${P}-fix-deps.patch"
)
src_test() {
	# Opt >= 1 causes SIGILL
	RUSTFLAGS="${RUSTFLAGS} -Copt-level=0" rust-crate_src_test
}
