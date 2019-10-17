# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Acquire a stack trace(backtrace) at runtime in a Rust program"
HOMEPAGE="https://github.com/rust-lang/backtrace-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test +libbacktrace"

RESTRICT="test"

F_LIBBACKTRACE="
	( =dev-rust/backtrace-sys-0.1*:= >=dev-rust/backtrace-sys-0.1.17 )

"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.6 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.45 )
	( =dev-rust/rustc-demangle-0.1*:= >=dev-rust/rustc-demangle-0.1.4 )
	libbacktrace? ( ${F_LIBBACKTRACE} )
"
PATCHES=(
	"${FILESDIR}/${P}-cargo.patch"
)
src_prepare() {
	# Not useful here
	rm -vrf ci/ || die
	# Pulls dev-deps and optional deps
	rm -vrf examples/ || die
	# Not usable by consumers
	rm -vrf benches/ || die
	default
}
