# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="URL library for rust, based on the WHATWG URL Standard"
HOMEPAGE="https://github.com/servo/rust-url"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="serde test"

F_SERDE="
	=dev-rust/serde-1*:=[derive]
"
BDEPEND="
	=dev-rust/idna-0.2*:=
	=dev-rust/matches-0.1*:=
	( =dev-rust/percent-encoding-2*:= >=dev-rust/percent-encoding-2.1.0 )
	serde? ( ${F_SERDE} )
	test? (
		${F_SERDE}
		=dev-rust/rustc-test-0.3*:=
		=dev-rust/serde_json-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-nobench.patch"
)
src_prepare() {
	# cruft files
	rm -vf appveyor.yml .travis.yml || die
	# benchmarks
	rm -vf benches/parse_url.rs || die
	default
}
