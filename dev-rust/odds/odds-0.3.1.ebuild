# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Misclenaeous collection extensions"
HOMEPAGE="https://github.com/bluss/odds"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	( =dev-rust/itertools-0.7*:= >=dev-rust/itertools-0.7.2 )
	( =dev-rust/quickcheck-0.4*:= >=dev-rust/quickcheck-0.4.1 )
"
BDEPEND="
	=dev-rust/rawpointer-0.1*:=
	=dev-rust/rawslice-0.1*:=
	( =dev-rust/unchecked-index-0.2*:= >=dev-rust/unchecked-index-0.2.2 )
	test? ( ${DEV_DEPEND} )
"
PATCHES=(
	"${FILESDIR}/${P}-nobench.patch"
)
src_prepare() {
	rm -vrf benches/ || die
	default
}
src_test() {
	local targets=(
		''
		'default'
		'docs'
		'std'
		'std-string'
		'std-vec'
		# Nightly only
		# 'unstable'
		# Simulate --all-features without nightly
		'default docs std std-string std-vec'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
}
