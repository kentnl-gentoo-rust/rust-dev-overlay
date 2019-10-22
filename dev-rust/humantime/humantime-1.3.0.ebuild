# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A parser and formatter for std::time::{Duration,SystemTime}"
HOMEPAGE="https://github.com/tailhook/humantime"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/quick-error-1*:=
	test? (
		( =dev-rust/rand-0.4*:= >=dev-rust/rand-0.4.2 )
		( =dev-rust/time-0.1*:= >=dev-rust/time-0.1.39 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-bad-deps.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
