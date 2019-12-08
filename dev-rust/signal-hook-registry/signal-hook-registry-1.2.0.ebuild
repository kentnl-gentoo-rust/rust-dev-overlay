# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Backend crate for signal-hook"
HOMEPAGE="https://github.com/vorner/signal-hook"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"
DEV_DEPEND="
	=dev-rust/signal-hook-0.1*:=
	=dev-rust/version-sync-0.8*:=
"
BDEPEND="
	=dev-rust/arc-swap-0.4*:=
	=dev-rust/libc-0.2*:=
"
