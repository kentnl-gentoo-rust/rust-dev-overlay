# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A macro for declaring lazily evaluated statics"
HOMEPAGE="https://github.com/rust-lang-nursery/lazy-static.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test spin-no-std"
F_SPIN_NO_STD="
	( =dev-rust/spin-0.4*:= >=dev-rust/spin-0.4.6 )
"
BDEPEND="
	spin-no-std? ( ${F_SPIN_NO_STD} )
	( =dev-rust/version_check-0.1*:= >=dev-rust/version_check-0.1.4 )
	test? (
		${F_SPIN_NO_STD}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-overflowing-literal.patch"
)
