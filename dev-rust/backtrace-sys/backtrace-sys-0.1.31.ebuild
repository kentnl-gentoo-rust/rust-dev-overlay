# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Bindings to the libbacktrace gcc library"
HOMEPAGE="https://github.com/alexcrichton/backtrace-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

# BSD via libbacktrace
LICENSE="|| ( MIT Apache-2.0 ) BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/libc-0.2*:=
	( =dev-rust/cc-1*:= >=dev-rust/cc-1.0.37 )
"
PATCHES=(
	"${FILESDIR}/${P}-no-nightly-cargo.patch"
)
