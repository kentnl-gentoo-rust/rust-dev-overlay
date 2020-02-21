# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Utilities for working with time-related functions"
HOMEPAGE="https://github.com/time-rs/time"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde test"

F_SERDE="
	=dev-rust/serde-1*:=[derive]
"
BDEPEND="
	=dev-rust/rustversion-1*:=
	=dev-rust/time-macros-0.1*:=
	serde? ( ${F_SERDE} )
	test? ( ${F_SERDE} )
"
src_prepare() {
	rm -vrf rustfmt.toml logo.svg || die
	default
}
src_test() {
	local targets=(
		''
		'serde'
		'default'
		'deprecated'
		'panicking-api'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
