# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A fork of Rust's 'test' crate without unstable language features"
HOMEPAGE="https://github.com/SimonSapin/rustc-test"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/getopts-0.2*:=
	=dev-rust/libc-0.2*:=
	=dev-rust/rustc-serialize-0.3*:=
	=dev-rust/term-0.4*:=
	=dev-rust/time-0.1*:=
	( =dev-rust/rustc_version-0.2*:= >=dev-rust/rustc_version-0.2.1 )
"
PATCHES=(
	"${FILESDIR}/${P}-nobench.patch"
)
