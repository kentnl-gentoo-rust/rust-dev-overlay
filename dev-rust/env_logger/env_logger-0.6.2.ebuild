# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An environment variable configured logging implementation for 'log'"
HOMEPAGE="https://github.com/sebasmagri/env_logger"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+atty +humantime +regex +termcolor test"

F_ATTY="
	( =dev-rust/atty-0.2*:= >=dev-rust/atty-0.2.5 )
"
F_HUMANTIME="
	( =dev-rust/humantime-1*:= >=dev-rust/humantime-1.1 )
"
F_REGEX="
	( =dev-rust/regex-1*:=[perf-literal,perf-cache] >=dev-rust/regex-1.0.3 )
"
F_TERMCOLOR="
	( =dev-rust/termcolor-1*:= >=dev-rust/termcolor-1.0.2 )
"

BDEPEND="
	=dev-rust/log-0.4*:=
	atty? ( ${F_ATTY} )
	humantime? ( ${F_HUMANTIME} )
	regex? ( ${F_REGEX} )
	termcolor? ( ${F_TERMCOLOR} )
	test? (
		${F_ATTY}
		${F_HUMANTIME}
		${F_REGEX}
		${F_TERMCOLOR}
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
