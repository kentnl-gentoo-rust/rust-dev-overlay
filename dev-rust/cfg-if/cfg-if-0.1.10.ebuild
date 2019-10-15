# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A macro for bulk use of #[cfg] parameters"
HOMEPAGE="https://github.com/alexchrichton/cfg-if"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
# this is used by anything using features = rustc-dep-of-std,
# however, compiler_builtins is as well, and that doesn't work on stable
# so providing that USE doesn't make much sense, but its declared here
# just-in-case
F_CORE="
	=dev-rust/rustc-std-workspace-core-1*:=
"
BDEPEND="
"
PATCHES=(
	"${FILESDIR}/${P}-cargo-stable.patch"
)
