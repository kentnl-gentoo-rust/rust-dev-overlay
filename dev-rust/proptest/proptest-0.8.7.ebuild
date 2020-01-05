# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Hypothesis-like property-based testing and shrinking"
HOMEPAGE="https://github.com/altsysrq/proptest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+bit-set +fork +std test +timeout"

F_BIT_SET="
	=dev-rust/bit-set-0.5*:=
"
F_STD="
	=dev-rust/rand-0.5*:=[std]
	( =dev-rust/quick-error-1*:= >=dev-rust/quick-error-1.2.1 )
	=dev-rust/regex-syntax-0.6*:=
"
F_FORK="
	${F_STD}
	( =dev-rust/rusty-fork-0.2*:= >=dev-rust/rusty-fork-0.2.1 )
	=dev-rust/tempfile-3*:=
"
F_TIMEOUT="
	${F_FORK}
	=dev-rust/rusty-fork-0.2*:=[timeout]
"
BDEPEND="
	( =dev-rust/bitflags-1*:= >=dev-rust/bitflags-1.0.1 )
	( =dev-rust/byteorder-1*:= >=dev-rust/byteorder-1.2.3 )
	=dev-rust/lazy_static-1*:=
	( =dev-rust/num-traits-0.2*:= >=dev-rust/num-traits-0.2.2 )
	=dev-rust/rand-0.5*:=
	bit-set? ( ${F_BIT_SET} )
	fork? ( ${F_FORK} )
	std? ( ${F_STD} )
	timeout? ( ${F_TIMEOUT} )
	test? (
		=dev-rust/regex-1*:=[perf-literal,perf-cache]
		${F_TIMEOUT}
		${F_BIT_SET}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
	"${FILESDIR}/${P}-fix-doctest.patch"
)
src_prepare() {
	rm -vrf examples/ gen-readme.sh appveyor.yml .travis.yml || die
	default
}
