# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Channels for async communication using 'futures'"
HOMEPAGE="https://github.com/rust-lang/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="sink test"
F_SINK="
	( =dev-rust/futures-sink-0.3*:= >=dev-rust/futures-sink-0.3.4 )
"
BDEPEND="
	( =dev-rust/futures-core-0.3*:= >=dev-rust/futures-core-0.3.4 )
	sink? ( ${F_SINK} )
	test? ( ${F_SINK} )
"
#PATCHES=(
#	"${FILESDIR}/${P}-no-test-circularity.patch"
#)
src_prepare() {
	rm -vrf benches/ || die
	rm -vrf tests/{channel,oneshot,mpsc-close,mpsc}.rs || die
	default
}
src_test() {
	local targets=(
		''
		'futures-sink'
		'alloc'
		# Nightly
		# 'cfg-target-has-atomic'
		'default'
		'sink'
		'std'
		'unstable'
	)
	for i in "${targets[@]}"; do
		local extra_flags=()
		# doctests fail 
		[[ "${i}" == "alloc" ]]   && extra_flags+=( "--tests" )
		[[ "${i}" == "default" ]] && extra_flags+=( "--tests" )
		[[ "${i}" == "std" ]]     && extra_flags+=( "--tests" )
		einfo "Testing ${extra_flags[*]} --features '${i}'"
		ecargo test --no-default-features "${extra_flags[@]}" --features "${i}"
	done
	einfo "Testing (synthetic) --tests --all-features"
	ecargo test --no-default-features --tests --features "${targets[*]}"
}
