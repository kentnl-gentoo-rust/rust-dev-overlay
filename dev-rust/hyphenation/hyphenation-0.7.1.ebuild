# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Knuth-Liang hyphenation for a variety of languages"
HOMEPAGE="https://github.com/tapeinosyne/hyphenation"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test embed-all normalize"
F_EMBED_ALL="
	=dev-rust/pocket-resources-0.3*:=
"
# nfc, nfd, nfkc, nfkd
F_NORMALIZE="
	=dev-rust/unicode-normalization-0.1*:=
"
BDEPEND="
	( =dev-rust/atlatl-0.1*:=[serde] >=dev-rust/atlatl-0.1.2 )
	=dev-rust/bincode-1*:=
	( =dev-rust/hyphenation_commons-0.7*:= >=dev-rust/hyphenation_commons-0.7.1 )
	=dev-rust/serde-1*:=
	embed-all? ( ${F_EMBED_ALL} )
	normalize? ( ${F_NORMALIZE} )
	test? (
		( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.1 )
		=dev-rust/quickcheck-0.7*:=[regex,use-logging]
		( =dev-rust/unicode-segmentation-1*:= >=dev-rust/unicode-segmentation-1.2 )
		${F_EMBED_ALL}
		${F_NORMALIZE}
	)
"
src_prepare() {
	rm -vrf benches/ || die
	default
}
