# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Bindings to libbzip2 for bzip2 (de)compression as Reader/Writer streams"
HOMEPAGE="https://github.com/alexcrichton/bzip2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/libc-0.2*:=
	=dev-rust/cc-1*:=
"
