# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Read number in big and little endian"
HOMEPAGE="https://github.com/BurntSushi/byteorder"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/doc-comment-0.3*:=
		=dev-rust/quickcheck-0.8*:=
		=dev-rust/rand-0.6*:=
	)
"
src_prepare() {
	rm -rvf benches/ || die
	default
}
src_test() {
	local targets=(
		''
		'default'
		'i128'
		'std'
	)
	for i in "${targets[@]}"; do
		local extra_flags=()
		# doctests break without std
		[[ "${i}" == "" ]] && extra_flags+=( "--tests" )
		[[ "${i}" == "i128" ]] && extra_flags+=( "--tests" )
		einfo "Testing ${extra_flags[*]} --features '${i}'"
		ecargo test --no-default-features "${extra_flags[@]}" --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
