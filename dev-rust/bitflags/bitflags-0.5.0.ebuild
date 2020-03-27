# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A macro to generate structures which behave like bitflags"
HOMEPAGE="https://github.com/bitflags/bitflags"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

src_test() {
	local targets=(
		''
		'no_std'
		# nightly
		# 'assignment_operators'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		RUSTFLAGS="--cap-lints warn" ecargo test --no-default-features --features "${i}"
	done
}
