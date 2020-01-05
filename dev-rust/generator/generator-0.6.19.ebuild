# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Stackfull Generator Library in Rust"
HOMEPAGE="https://github.com/Xudong-Huang/generator-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/log-0.4*:=
	=dev-rust/cc-1*:=
	=dev-rust/rustc_version-0.2*:=
	=dev-rust/libc-0.2*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
