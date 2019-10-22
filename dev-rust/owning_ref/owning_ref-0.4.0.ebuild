# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Create references that carry their owner with them"
HOMEPAGE="https://github.com/Kimundi/owning-ref-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/stable_deref_trait-1*:=
"
