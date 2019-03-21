# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Raw bindings to platform APIs for Rust"
HOMEPAGE="https://github.com/rust-lang/libc"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	~dev-rust/rustc-std-workspace-core-1.0.0:=
"
