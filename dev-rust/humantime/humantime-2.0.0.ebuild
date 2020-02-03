# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A parser and formatter for std::time::{Duration,SystemTime}"
HOMEPAGE="https://github.com/tailhook/humantime"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	test? (
		=dev-rust/rand-0.6*:=[std]
		=dev-rust/time-0.1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench.patch"
)
src_prepare() {
	rm -vrf bulk.yaml benches/ .travis.yml vagga.yaml || die
	default
}
