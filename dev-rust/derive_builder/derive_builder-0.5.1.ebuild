# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Rust macro to auto-implement builder pattern for arbitrary structs"
HOMEPAGE="https://github.com/colin-kiegel/rust-derive-builder"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="logging test"
F_COMPILETEST_RS="
	( =dev-rust/compiletest_rs-0.3*:= >=dev-rust/compiletest_rs-0.3.3 )
"
F_ENV_LOGGER="
	=dev-rust/env_logger-0.4*:=[regex]
"
F_LOG="
	=dev-rust/log-0.3*:=
"
F_SKEPTIC="
	=dev-rust/skeptic-0.9*:=
"
F_LOGGING="
	${F_LOG}
	${F_ENV_LOGGER}
	=dev-rust/derive_builder_core-0.2*:=[logging]
"
DEV_DEPENDS="
	=dev-rust/pretty_assertions-0.2*:=
"
BDEPEND="
	=dev-rust/derive_builder_core-0.2*:=
	=dev-rust/quote-0.3*:=
	=dev-rust/syn-0.11*:=[printing,parsing]
	logging? ( ${F_LOGGING} )
	test? (
		${DEV_DEPENDS}
		${F_COMPILETEST_RS}
		${F_LOGGING}
		${F_SKEPTIC}
	)
"
src_prepare() {
	rm -vrf examples/ || die
	default
}

my_dotest() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" \
		ecargo test --no-default-features --features "$1"
	# https://github.com/budziq/rust-skeptic/issues/18
	rm -v "${WORKDIR}/debug/deps/libderive_builder-"*
}
src_test() {
	local targets=(
		''
		'compiletest_rs'
		'env_logger'
		'log'
		'skeptic'

		'logging'
		# nightly only
		# 'nightlytests'
		'skeptic_tests'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		my_dotest "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	my_dotest "${targets[*]}"
}
