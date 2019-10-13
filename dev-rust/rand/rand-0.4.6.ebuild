# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Random number generation for Rust"
HOMEPAGE="https://github.com/rust-random/rand"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"

PATCHES=(
	"${FILESDIR}/${PF}-unix-cargo.patch"
)
F_STD="
	=dev-rust/libc-0.2*:=
"
BDEPEND="
	std? ( ${F_STD} )
	test? ( ${F_STD} )
"
src_prepare() {
	# Do not compile on stable: https://github.com/rust-random/rand/issues/896
	rm -vrf benches/
	default
}
