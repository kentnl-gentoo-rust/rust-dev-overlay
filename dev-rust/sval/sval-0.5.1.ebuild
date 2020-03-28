# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A no-std, object-safe serialization framework"
HOMEPAGE="https://github.com/sval-rs/sval"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="arbitrary-depth derive serde test"
F_SERDE_LIB="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.104 )
"
F_SMALLVEC="
	=dev-rust/smallvec-1*:=
"
F_SVAL_DERIVE="
	( =dev-rust/sval_derive-0.5*:= >=dev-rust/sval_derive-0.5.1 )
"

BDEPEND="
	arbitrary-depth? ( ${F_SMALLVEC} )
	derive? ( ${F_SVAL_DERIVE} )
	serde? ( ${F_SERDE_LIB} )
	test? (
		=dev-rust/quickcheck-0.9*:=[use-logging,regex]
		${F_SERDE_LIB}
		${F_SMALLVEC}
		${F_SVAL_DERIVE}
	)
"
src_prepare() {
	rm -vrf benches/ rustfmt.toml || die
	default
}
my_test() {
	local features="$1"
	shift
	if [[ "${features}" == "--all" ]] ; then
		einfo "Testing --all-features $@"
		ecargo test --all-features "$@"
	else
		einfo "Testing --features \"${features}\" $@"
		ecargo test --no-default-features --features "${features}" "$@"
	fi
}
src_test() {
	my_test ''
	my_test 'serde_lib'
	my_test 'smallvec'
	my_test 'sval_derive'
	my_test 'alloc'
	my_test 'arbitrary-depth'
	# derive requires std
	my_test 'derive std'
	my_test 'fmt'
	my_test 'serde'
	my_test 'std'
	my_test 'test'
	my_test --all
}
