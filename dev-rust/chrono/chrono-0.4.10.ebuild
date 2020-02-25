# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Date and time library for Rust"
HOMEPAGE="https://github.com/chronotope/chrono"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+clock rustc-serialize test serde"

F_RUSTC_SERIALIZE="
	( =dev-rust/rustc-serialize-0.3*:= >=dev-rust/rustc-serialize-0.3.20 )
"
F_SERDE="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.99 )
"
F_TIME="
	( =dev-rust/time-0.1*:= >=dev-rust/time-0.1.39 )
"
F_CLOCK="${F_TIME}"

PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-serde_test.patch"
)
BDEPEND="
	( =dev-rust/num-integer-0.1*:= >=dev-rust/num-integer-0.1.36 )
	=dev-rust/num-traits-0.2*:=
	serde? ( ${F_SERDE} )
	clock? ( ${F_CLOCK} )
	rustc-serialize? ( ${F_RUSTC_SERIALIZE} )
	test? (
		=dev-rust/bincode-0.8*:=
		=dev-rust/doc-comment-0.3*:=
		( =dev-rust/num-iter-0.1*:= >=dev-rust/num-iter-0.1.35 )
		=dev-rust/serde_derive-1*:=
		=dev-rust/serde_json-1*:=
		${F_SERDE}
		${F_CLOCK}
		${F_RUSTC_SERIALIZE}
	)
"
src_test() {
	local targets=(
		# All doc-tests fail without 'clock'
		'clock'
		'clock alloc'
		# Activates Feature(test)
		# 'clock bench'
		'clock default'
		'clock rustc-serialize'
		'clock serde'
		'clock std'
		'clock time'
		# All features without bench with clock deduped
		'alloc default rustc-serialize serde std time'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --tests --no-default-features --features "${i}"
	done
}
