# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Test your Rust markdown documentation via Cargo"
HOMEPAGE="https://github.com/brson/rust-skeptic"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/pulldown-cmark-0.0.8*:=
	( =dev-rust/tempdir-0.3*:= >=dev-rust/tempdir-0.3.4 )
"
