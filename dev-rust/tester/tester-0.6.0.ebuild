# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A fork of Rusts 'test' crate without needing unstable language features"
HOMEPAGE="https://github.com/messense/rustc-test"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE=" || ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/getopts-0.2*:=
	=dev-rust/libc-0.2*:=
	=dev-rust/term-0.6*:=
"
