# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Core promitives for application-level tracing"
HOMEPAGE="https://github.com/tokio-rs/tracing"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+std test"
BDEPEND="
	=dev-rust/lazy_static-1*:=
	!std? ( dev-rust/lazy_static[spin-no-std] )
	=dev-rust/spin-0.5*:=
	test? ( dev-rust/lazy_static[spin-no-std] )
"
