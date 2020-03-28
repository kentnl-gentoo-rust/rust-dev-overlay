# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Demangle C++ symbols"
HOMEPAGE="https://github.com/gimli-rs/cpp_demangle"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="fuzz test"

F_FUZZ="
	( =dev-rust/afl-0.5*:= >=dev-rust/afl-0.5.1 )
"
# TODO: Install binary "afl_runner"?
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.9 )
	=dev-rust/glob-0.3*:=
	fuzz? ( ${F_FUZZ} )
	test? (
		( =dev-rust/diff-0.1*:= >=dev-rust/diff-0.1.11 )
		${F_FUZZ}
)
"
src_prepare() {
	eapply "${FILESDIR}/${P}-nobins.patch"
	rm -vf "examples/cppfilt.rs" "src/bin/afl_runner.rs" || die
	default
}
src_test() {
	local targets=(
		''

		#'afl' # broken
		#'alloc' # nightly
		'cppfilt'
		'default'
		#'fuzz' # broken
		'logging'
		'nightly'
		'run_libiberty_tests'
		'std'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing (synthetic) --all-features"
	ecargo test --no-default-features --features "${targets[*]}"

}
