# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Decorates a 'Service' to allow easy composition between services"
HOMEPAGE="https://github.com/tower-rs/tower"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEV_DEPEND="
	=dev-rust/tower-service-0.3*:=
"
BDEPEND="
	test? ( ${DEV_DEPEND} )
"
