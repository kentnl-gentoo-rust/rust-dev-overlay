# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="The missing YAML 1.2 parser for rust"
HOMEPAGE="https://github.com/chyh1990/yaml-rust"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( >=dev-rust/linked-hash-map-0.0.9:= <dev-rust/linked-hash-map-0.6 )
	test? (
		=dev-rust/quickcheck-0.7*:=
	)
"
src_prepare() {
	# Pulls all optional deps
	rm -vrf examples/ || die
	default
}
