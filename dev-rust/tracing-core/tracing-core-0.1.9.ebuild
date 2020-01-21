# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core promitives for application-level tracing"
HOMEPAGE="https://github.com/tokio-rs/tracing"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"
F_STD="
	=dev-rust/lazy_static-1*:=
"
BDEPEND="
	std? ( ${F_STD} )
	test? ( ${F_STD} )
"
