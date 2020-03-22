# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="OS backed Random Number Generator"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="log test"

BDEPEND="
	( =dev-rust/getrandom-0.1*:=[log?] >=dev-rust/getrandom-0.1.1 )
	=dev-rust/rand_core-0.5*:=
	test? (
		=dev-rust/getrandom-0.1*:=[log]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_test() {
	local targets=(
		''
		'log'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
