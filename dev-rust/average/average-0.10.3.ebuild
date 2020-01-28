# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Calculate statistics iteratively"
HOMEPAGE="https://github.com/vks/average"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde1 test"

F_SERDE1="
	=dev-rust/serde-1*:=[derive]
	( =dev-rust/serde-big-array-0.1*:= >=dev-rust/serde-big-array-0.1.4 )
	=dev-rust/serde_derive-1*:=
"
BDEPEND="
( =dev-rust/conv-0.3*:= >=dev-rust/conv-0.3.3 )
	=dev-rust/float-ord-0.2*:=
	=dev-rust/num-traits-0.2*:=
	serde1? ( ${F_SERDE1} )
	test? (
		${F_SERDE1}
		=dev-rust/proptest-0.9*:=[bit-set,fork,std,timeout]
		=dev-rust/quantiles-0.7*:=
		=dev-rust/rand-0.7*:=[std]
		( =dev-rust/rand_distr-0.2*:= >=dev-rust/rand_distr-0.2.1 )
		=dev-rust/rand_xoshiro-0.3*:=
		=dev-rust/serde_json-1*:=
		=dev-rust/streaming-stats-0.2*:=
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-0.9.4-nobench.patch"
)
src_prepare() {
	# Do not compile on stable
	rm -vrf benches/ || die
	default
}
