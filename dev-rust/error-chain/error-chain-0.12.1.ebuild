# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Yet another error boilerplate library"
HOMEPAGE="https://github.com/rust-lang-nursery/error-chain"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+backtrace test"
F_BACKTRACE="
	( =dev-rust/backtrace-0.3*:=[libbacktrace] >=dev-rust/backtrace-0.3.3 )
"
BDEPEND="
	backtrace? ( ${F_BACKTRACE} )
	( =dev-rust/version_check-0.1*:= >=dev-rust/version_check-0.1.5 )
	test? ( ${F_BACKTRACE} )
"
PATCHES=(
	"${FILESDIR}/${P}-broken-target-path.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	if ! use test; then
		rm -vr src/bin || die
	fi
	default
}
