# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Procedural macro attributes for auto instrumenting functions"
HOMEPAGE="https://github.com/tokio-rs/tracing"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"
DEV_DEPEND="
	=dev-rust/tracing-0.1*:=
	=dev-rust/tracing-futures-0.2*:=[std,std-future]
"
BDEPEND="
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=[printing,proc-macro]
	test? (
		${DEV_DEPEND}
	)
"
src_test() {
	# Tests are unsolvably broken
	ecargo build --all-features
}
