# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A lorem ipsum text generator"
HOMEPAGE="https://github.com/mgeisler/lipsum"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/rand-0.6*:=[std]
	test? (
		=dev-rust/rand_xorshift-0.1*:=
		=dev-rust/version-sync-0.6*:=
	)
"
src_prepare() {
	rm -vrf benches/ examples/ || die
	default
}
