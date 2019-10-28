# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Unicode String normalization (Canon, Compat, Decomp, Recomp)"
HOMEPAGE="https://github.com/unicode-rs/unicode-normalization"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	=dev-rust/smallvec-0.6*:=
"
src_test() {
	# Tests broken by upstream
	# https://github.com/unicode-rs/unicode-normalization/issues/38
	ecargo build --release --all-features
}
