# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Helper methods and macros for custom derives"
HOMEPAGE="https://github.com/mystor/synstructure"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"
BDEPEND="
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=
	=dev-rust/unicode-xid-0.2*:=
"
