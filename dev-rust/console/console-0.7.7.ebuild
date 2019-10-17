# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A terminal and console abstraction for Rust"
HOMEPAGE="https://github.com/mitsuhiko/console"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( =dev-rust/atty-0.2*:= >=dev-rust/atty-0.2.11 )
	=dev-rust/clicolors-control-1*:=
	=dev-rust/lazy_static-1*:=
	=dev-rust/libc-0*:=
	=dev-rust/parking_lot-0*:=
	=dev-rust/regex-1*:=[perf-literal,perf-cache]
	=dev-rust/unicode-width-0.1*:=
	=dev-rust/termios-0.3*:=
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
