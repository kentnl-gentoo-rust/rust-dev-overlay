# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Web PKI X.509 Certificate Verification"
HOMEPAGE="https://github.com/brainsmith/webpki"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ISC BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"

BDEPEND="
	=dev-rust/ring-0.16*:=
	=dev-rust/untrusted-0.7*:=
"
