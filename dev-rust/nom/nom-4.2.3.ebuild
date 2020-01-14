# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A byte-oriented, zero-copy, parse combinators library"
HOMEPAGE="https://github.com/Geal/nom"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="regexp regexp-macros test"
F_REGEXP="
	=dev-rust/regex-1*:=[perf-cache,perf-literal]
"
F_REGEXP_MACROS="
	${F_REGEXP}
	=dev-rust/lazy_static-1*:=
"
BDEPEND="
	=dev-rust/memchr-2*:=
	=dev-rust/version_check-0.1*:=
	test? (
		${F_REGEXP_MACROS}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-bench.patch"
)
