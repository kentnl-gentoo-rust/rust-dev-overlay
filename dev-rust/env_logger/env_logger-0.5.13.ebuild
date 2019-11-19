# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An environment variable configured logging implementation for 'log'"
HOMEPAGE="https://github.com/sebasmagri/env_logger"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+regex test"

F_REGEX="
	( =dev-rust/regex-1*:=[perf-literal,perf-cache] >=dev-rust/regex-1.0.3 )
"
BDEPEND="
	( =dev-rust/atty-0.2*:= >=dev-rust/atty-0.2.5 )
	=dev-rust/log-0.4*:=
	( =dev-rust/humantime-1*:= >=dev-rust/humantime-1.1 )
	regex? ( ${F_REGEX} )
	=dev-rust/termcolor-1*:=
	test? (
		${F_REGEX}
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
