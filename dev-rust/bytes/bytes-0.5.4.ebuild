# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Types and traits for working with bytes"
HOMEPAGE="https://github.com/tokio-rs/bytes"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="serde"

F_SERDE="
	=dev-rust/serde-1*:=
"
BDEPEND="
	serde? ( ${F_SERDE} )
	test? (
		( =dev-rust/loom-0.2*:= >=dev-rust/loom-0.2.10 )
		${F_SERDE}
		=dev-rust/serde_test-1*:=
	)
"
src_prepare() {
	rm -vrf azure-pipelines.yml benches ci || die
	default
}
