# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Codegen library for PHF types"
HOMEPAGE="https://github.com/sfackler/rust-phf"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/phf_generator-0.7*:= >=dev-rust/phf_generator-0.7.24 )
	( =dev-rust/phf_shared-0.7*:= >=dev-rust/phf_shared-0.7.24 )
"
