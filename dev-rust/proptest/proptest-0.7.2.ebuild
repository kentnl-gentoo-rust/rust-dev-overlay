# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Hypothesis-like property-based testing and shrinking"
HOMEPAGE="https://github.com/altsysrq/proptest"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+fork +std test +timeout"

F_STD="
	=dev-rust/rand-0.4*:=[std]
	( =dev-rust/quick-error-1*:= >=dev-rust/quick-error-1.2.1 )
	( =dev-rust/regex-syntax-0.4*:= >=dev-rust/regex-syntax-0.4.2 )
"
F_FORK="
	${F_STD}
	=dev-rust/rusty-fork-0.2*:=
	=dev-rust/tempfile-3*:=
"
F_TIMEOUT="
	${F_FORK}
	=dev-rust/rusty-fork-0.2*:=[timeout]
"
BDEPEND="
	=dev-rust/bit-set-0.5*:=
	( =dev-rust/bitflags-1*:= >=dev-rust/bitflags-1.0.1 )
	=dev-rust/lazy_static-1*:=
	( =dev-rust/num-traits-0.2*:= >=dev-rust/num-traits-0.2.2 )
	( =dev-rust/rand-0.4*:= >=dev-rust/rand-0.4.2 )
	fork? ( ${F_FORK} )
	std? ( ${F_STD} )
	timeout? ( ${F_TIMEOUT} )
	test? (
		( =dev-rust/regex-0.2*:= >=dev-rust/regex-0.2.5 )
		${F_TIMEOUT}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly.patch"
)
src_prepare() {
	rm -vrf examples/ gen-readme.sh appveyor.yml .travis.yml || die
	default
}
