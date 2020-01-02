# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Ensure README versions update with the crate"
HOMEPAGE="https://github.com/mgeisler/version-sync"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/itertools-0.8*:=
	=dev-rust/proc-macro2-0.4*:=
	=dev-rust/pulldown-cmark-0.4*:=
	( =dev-rust/regex-1*:=[perf-literal,perf-cache] >=dev-rust/regex-1.1 )
	=dev-rust/semver-parser-0.9*:=
	=dev-rust/syn-0.15*:=[printing,proc-macro]
	=dev-rust/toml-0.5*:=
	=dev-rust/url-1*:=
"
PATCHES=(
	"${FILESDIR}/${P}-broken-test.patch"
)
