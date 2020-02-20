# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core traits and types for the 'futures' library"
HOMEPAGE="https://github.com/rust-lang/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

src_test() {
	local targets=(
		''
		'alloc'
		# nightly only feature(...)
		# 'cfg-target-has-atomic'
		'default'
		'std'
		'unstable'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		# doc tests broken
		# https://github.com/rust-lang/futures-rs/issues/2025
		ecargo test --tests --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --tests --no-default-features --features "${targets[*]}"
}
