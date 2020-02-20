# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core APIs for Rayon"
HOMEPAGE="https://github.com/rayon-rs/rayon"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/crossbeam-deque-0.7*:= >=dev-rust/crossbeam-deque-0.7.2 )
	=dev-rust/crossbeam-queue-0.2*:=[std]
	=dev-rust/crossbeam-utils-0.7*:=[std]
	=dev-rust/lazy_static-1*:=
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.2 )
	test? (
		=dev-rust/rand-0.6*:=[std]
		=dev-rust/rand_xorshift-0.1*:=
		=dev-rust/scoped-tls-1*:=
		=dev-rust/libc-0.2*:=
	)
"
PATCHES=(
	# https://github.com/rayon-rs/rayon/issues/710
	"${FILESDIR}/${PN}-1.6.0-broken-tests.patch"
)
src_prepare() {
	rm -vf "tests/stack_overflow_crash.rs" || die
	default
}
