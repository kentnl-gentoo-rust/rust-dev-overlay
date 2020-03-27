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
	( =dev-rust/same-file-1*:= >=dev-rust/same-file-1.0.1 )
	test? (
		=dev-rust/doc-comment-0.3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-2.2.9-unix-cargo.patch"
)
src_prepare() {
	rm -vrf compare/ rustfmt.toml || die
	default
}
