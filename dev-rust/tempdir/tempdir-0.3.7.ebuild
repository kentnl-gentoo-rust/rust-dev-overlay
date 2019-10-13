# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A library for self-destructing temporary directories"
HOMEPAGE="https://github.com/rust-lang/tempdir"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""
BDEPEND="
	=dev-rust/rand-0.4*:=[std]
	=dev-rust/remove_dir_all-0.5*:=
"
