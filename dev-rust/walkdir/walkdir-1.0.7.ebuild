# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Recursively walk a directory"
HOMEPAGE="https://github.com/BurntSushi/walkdir"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/same-file-0.1*:= >=dev-rust/same-file-0.1.1 )
	test? (
		=dev-rust/quickcheck-0.4*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
