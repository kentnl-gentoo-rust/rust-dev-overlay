# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Automatic property based testing with shrinking"
HOMEPAGE="https://github.com/BurntSushi/quickcheck"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Unlicense MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="+regex +use-logging test"

F_REGEX="
	=dev-rust/env_logger-0.7*:=[regex]
"
F_USE_LOGGING="
	=dev-rust/env_logger-0.7*:=
	=dev-rust/log-0.4*:=
"

BDEPEND="
	=dev-rust/rand-0.7*:=[std]
	=dev-rust/rand_core-0.5*:=
	regex? ( ${F_REGEX} )
	use-logging? ( ${F_USE_LOGGING} )
	test? (
		${F_REGEX}
		${F_USE_LOGGING}
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}

src_test() {
	local targets=(
		''
		'env_logger'
		'log'

		'default'
		'regex'
		'unstable'
		'use_logging'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
