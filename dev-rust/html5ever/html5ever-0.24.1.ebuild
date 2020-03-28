# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="High-performance browser-grade HTML5 parser"
HOMEPAGE="https://github.com/servo/html5ever"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/log-0.4*:=
	=dev-rust/mac-0.1*:=
	=dev-rust/markup5ever-0.9*:=
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=
	test? (
		=dev-rust/rustc-test-0.3*:=
		=dev-rust/serde_json-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-exbench.patch"
)
src_prepare() {
	rm -vrf benches/ examples/ || die
	default
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
