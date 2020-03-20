# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Random number generator based on timing jitter"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="log std test"
F_LOG="
	=dev-rust/log-0.4*:=
"
BDEPEND="
	=dev-rust/rand_core-0.5*:=[std?]
	log? ( ${F_LOG} )
	test? (
		${F_LOG}
		=dev-rust/rand_core-0.5*:=[std]
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-0.1.4-unix-cargo.patch"
)

src_prepare() {
	rm -vrf benches/ || die
	default
}
src_test() {
	local targets=(
		''
		'log'

		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
