# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Safe interface to memchr"
HOMEPAGE="https://github.com/BurntSushi/rust-memchr"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="libc test"
F_LIBC="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.18 )
"
BDEPEND="
	libc? ( ${F_LIBC} )
	test? (
		${F_LIBC}
		=dev-rust/quickcheck-0.9*:=
	)
"
src_prepare() {
	rm -vrf rustfmt.toml || die
	default
}
src_test() {
	local targets=(
		# https://github.com/BurntSushi/rust-memchr/issues/71
		# ''
		# ^ same reason
		'std libc'
		'default'
		'std'
		'use_std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
