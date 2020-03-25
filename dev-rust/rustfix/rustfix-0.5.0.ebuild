# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Automatically apply suggestions made by rustc"
HOMEPAGE="https://github.com/rust-lang-nursery/rustfix"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/anyhow-1*:=
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.1 )
	=dev-rust/serde-1*:=[derive]
	=dev-rust/serde_json-1*:=
	test? (
		=dev-rust/proptest-0.7*:=[fork,std,timeout]
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-0.4.6-unused-deps.patch"
)
src_prepare() {
	rm -vrf bors.toml .appveyor.yml .travis.yml || die
	default
}
