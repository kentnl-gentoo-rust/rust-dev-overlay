# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Certificate transparency SCT verification library"
HOMEPAGE="https://github.com/ctz/sct.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 ISC MIT )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/ring-0.16*:=[dev-urandom-fallback]
	=dev-rust/untrusted-0.7*:=
"
