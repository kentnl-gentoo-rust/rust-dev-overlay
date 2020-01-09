# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A terminal and console abstraction for Rust"
HOMEPAGE="https://github.com/mitsuhiko/console"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+unicode-width"

F_UNICODE_WIDTH="
	=dev-rust/unicode-width-0.1*:=
"
BDEPEND="
	=dev-rust/clicolors-control-1*:=
	=dev-rust/lazy_static-1*:=
	=dev-rust/libc-0.2*:=
	( =dev-rust/regex-1*:= >=dev-rust/regex-1.3.1 )
	unicode-width? ( ${F_UNICODE_WIDTH} )
	=dev-rust/termios-0.3*:=
	test? ( ${F_UNICODE_WIDTH} )
"
PATCHES=(
	"${FILESDIR}/${PN}-0.8.0-unix-cargo.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
