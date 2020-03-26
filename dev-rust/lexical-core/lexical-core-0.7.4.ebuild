# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Lexical, to- and from-string conversion routines"
HOMEPAGE="https://github.com/Alexhuszagh/rust-lexical"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+correct format grisu3 +ryu"

F_STATIC_ASSERTIONS="
	=dev-rust/static_assertions-1*:=
"
F_CORRECT="
	=dev-rust/arrayvec-0.5*:=
	${F_STATIC_ASSERTIONS}
"
F_FORMAT="
	${F_STATIC_ASSERTIONS}
"
F_GRISU3="
	=dev-rust/dtoa-0.4*:=
"
F_RYU="
	=dev-rust/ryu-1*:=
"
DEV_DEPEND="
	=dev-rust/approx-0.3*:=
	( =dev-rust/proptest-0.9*:=[bit-set,fork,std,timeout] >=dev-rust/proptest-0.9.4 )
	( =dev-rust/quickcheck-0.9*:=[regex,use-logging] >=dev-rust/quickcheck-0.8.5 )
"
BDEPEND="
	( =dev-rust/bitflags-1*:= >=dev-rust/bitflags-1.2 )
	=dev-rust/cfg-if-0.1*:=
	correct? ( ${F_CORRECT} )
	format? ( ${F_FORMAT} )
	grisu3? ( ${F_GRISU3} )
	ryu? ( ${F_RYU} )
	test? (
		${F_CORRECT}
		${F_FORMAT}
		${F_GRISU3}
		${F_RYU}
		${DEV_DEPEND}
	)
"
src_test() {
	# std required due to [not( feature = std ),feature...]
	local targets=(
		# --all-features can't work because ryu and grius3 are mutex
		# and default implies ryu
		"ryu default arrayvec correct format noinline dtoa radix rounding table trim_floats unchecked_index"
		"grisu3 arrayvec correct format dtoa noinline radix rounding table trim_floats unchecked_index"
		''
		arrayvec
		correct
		default
		dtoa
		format
		grisu3
		noinline
		radix
		rounding
		ryu
		table
		trim_floats
		unchecked_index
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features 'std $i'"
		ecargo test --no-default-features --features "std ${i}"
	done
}
