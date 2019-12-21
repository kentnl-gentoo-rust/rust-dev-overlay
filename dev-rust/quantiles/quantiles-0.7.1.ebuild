# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Approximate quantile algorithms"
HOMEPAGE="https://github.com/postmates/quantiles"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="serde-support"

F_SERDE_SUPPORT="
	=dev-rust/serde-1*:=
	=dev-rust/serde_derive-1*:=
"
BDEPEND="
	serde-support? ( ${F_SERDE_SUPPORT} )
	test? (
		${F_SERDE_SUPPORT}
		=dev-rust/quickcheck-0.5*:=
	)
"
src_prepare() {
	# Do not compile on stable
	rm -vrf benches/ || die
	default
}
