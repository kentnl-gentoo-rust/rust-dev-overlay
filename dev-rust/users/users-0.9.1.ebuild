# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Library for getting info on Unix users and groups"
HOMEPAGE="https://github.com/ogham/rust-users"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.50 )

"
src_prepare() {
	# Causes dep explosion
	rm -vrf examples/ || die
	default
}
my_test() {
	einfo "Testing $(printf "%q " "$@")"
	ecargo test "$@"
}
src_test() {
	my_test --no-default-features --features 'cache'
	my_test --no-default-features --features 'default'
	# doctests need cache
	my_test --no-default-features --features 'mock' --lib --tests
	my_test --all-features
}
