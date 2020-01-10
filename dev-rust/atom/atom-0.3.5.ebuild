# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A safe abstraction around AtomicPtr"
HOMEPAGE="https://github.com/slide-rs/atom"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	rm -vrf examples/ || die
	default
}
