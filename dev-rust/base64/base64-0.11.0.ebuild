# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="encodes or decodes bas64 as bytes or utf8"
HOMEPAGE="https://github.com/marshallpierce/rust-base64"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/doc-comment-0.3*:=
		( =dev-rust/rand-0.6*:=[std] >=dev-rust/rand-0.6.1 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench-eg-deps.patch"
)
src_prepare() {
	# needs criterion
	rm -vrf benches/ || die
	# Causes optional deps pulled in
	rm -vrf examples/ || die
	# Unneeded
	rm -v icon_CLion.svg || die
	default
}
