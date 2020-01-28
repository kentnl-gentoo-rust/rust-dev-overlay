# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="ANSI terminal colours and styles"
HOMEPAGE="https://github.com/ogham/rust-ansi-term"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="derive-serde-style test"
F_DERIVE_SERDE_STYLE="
	( =dev-rust/serde-1*:=[derive] >=dev-rust/serde-1.0.90 )
"
DEV_DEPEND="
	=dev-rust/doc-comment-0.3*:=
	( =dev-rust/regex-1*:=[perf-literal,perf-cache] >=dev-rust/regex-1.1.9 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_json-1.0.39 )
"
BDEPEND="
	derive-serde-style? ( ${F_DERIVE_SERDE_STYLE} )
	test? (
		${F_DERIVE_SERDE_STYLE}
		${DEV_DEPEND}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	rm -rfv examples/ || die
	default
}
