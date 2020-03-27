# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Determine whether two file paths point to the same file"
HOMEPAGE="https://github.com/BurntSushi/same-file"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	test? (
		=dev-rust/doc-comment-0.3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -vrf examples/ rustfmt.toml || die
	default
}
