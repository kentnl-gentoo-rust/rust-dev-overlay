# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A collection of great and ubiquitous macros"
HOMEPAGE="https://github.com/reem/rust-mac"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
