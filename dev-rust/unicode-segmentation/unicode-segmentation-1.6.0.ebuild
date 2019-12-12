# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Unicode Annex 29 Grapheme Cluster, Word and Sentence boundaries"
HOMEPAGE="https://github.com/unicode-rs/unicode-segmentation"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	test? (
		=dev-rust/quickcheck-0.7*:=[regex,use-logging]
	)
"
