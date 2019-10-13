# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A safe implementation of remove_dir_all for Windows"
HOMEPAGE="https://github.com/XAMPPRocky/remove_dir_all"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
	"${FILESDIR}/${P}-doctest-fix.patch"
	"${FILESDIR}/${P}-readme.patch"
)
# Note, this whole crate is a no-op on non-windows
# and it just proxies std::fs::remove_dir_all
BDEPEND="
	test? (
		=dev-rust/doc-comment-0.3*:=
	)
"
