# Copyright 2019 Gentoo Authors
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
	=dev-rust/env_logger-0.5*:=[regex]
"
F_USE_LOGGING="
	=dev-rust/env_logger-0.5*:=
	=dev-rust/log-0.4*:=
"

BDEPEND="
	=dev-rust/rand-0.5*:=
	( =dev-rust/rand_core-0.2*:= >=dev-rust/rand_core-0.2.1 )
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
