# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Automatic cfg for Rust compiler features"
HOMEPAGE="https://github.com/cuviper/autocfg"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	# Default tests broken by invalid TARGET
	# https://github.com/gyakovlev/rust-dev-overlay/issues/3
	# # Tests write to ./target and fail if ./target doesn't exist
	mkdir -p target
	rust-crate_src_test
}
