# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Experimental error handling abstraction"
HOMEPAGE="https://github.com/rust-lang-nursery/failure"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std +derive"

F_STD="
	( =dev-rust/backtrace-0.3*:=[libbacktrace] >=dev-rust/backtrace-0.3.3 )
"
F_DERIVE="
	( =dev-rust/failure_derive-0.1*:= >=dev-rust/failure_derive-0.1.6 )
"
BDEPEND="
	std? ( ${F_STD} )
	derive? ( ${F_DERIVE} )
	test? (
		${F_STD}
		${F_DERIVE}
	)
"
src_prepare() {
	# Not useful here
	rm -vrf book/ || die
	rm -v build-docs.sh || die
	rm -v Cargo.lock.ci || die
	# Forces all deps
	rm -vrf examples/ || die
	rm -v travis.sh || die
	default
}
