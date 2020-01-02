# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Structured, extensible, composable logging"
HOMEPAGE="https://github.com/slog-rs/slog"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MPL-2.0 MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="nested-values"

F_ERASED_SERDE="
	=dev-rust/erased-serde-0.3*:=
"
BDEPEND="
	nested-values? ( ${F_ERASED_SERDE} )
	test? ( ${F_ERASED_SERDE} )
"
PATCHES=(
	"${FILESDIR}/${P}-no-examples.patch"
)
src_prepare() {
	rm -rvf examples/ || die
	default
}
