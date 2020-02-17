# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Lightweight clone of pin-project using declarative macros"
HOMEPAGE="https://github.com/taiki-e/pin-project-lite"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	test? (
		=dev-rust/rustversion-1*:=
		=dev-rust/trybuild-1*:=
	)
"
src_prepare() {
	rm -vrf ci/ || die
	default
}
