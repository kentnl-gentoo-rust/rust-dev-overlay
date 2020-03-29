# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="File System and Path utility functions"
HOMEPAGE="https://github.com/sagiegurari/fsio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="+temp-path test"
F_RAND="=dev-rust/rand-0.7*:=[std]"
F_USERS="=dev-rust/users-0.9*:="
BDEPEND="
	temp-path? ( ${F_RAND} ${F_USERS} )
	test? ( ${F_RAND} ${F_USERS} )
"
src_prepare() {
	rm -vrf Makefile.toml docs/ examples/ || die
	default
}
my_test() {
	einfo "Testing $(printf "%q " "$@")"
	ecargo test "$@"
	# Not only does this have race conditions in tests
	# but failures with multiple test runs! Fun!
	if [[ -e ./target/__test ]]; then
		rm -rf ./target/__test || die
	fi
}
src_test() {
	# none
	my_test --no-default-features --features '' -- --test-threads=1
	# implicit features via optional = true
	my_test --no-default-features --features 'rand' -- --test-threads=1
	my_test --no-default-features --features 'users' -- --test-threads=1
	# features
	my_test --no-default-features --features 'default' -- --test-threads=1
	my_test --no-default-features --features 'temp-path' -- --test-threads=1
	my_test --all-features -- --test-threads=1
}
