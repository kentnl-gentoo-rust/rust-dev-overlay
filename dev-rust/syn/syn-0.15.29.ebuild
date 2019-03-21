# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Parser for Rust source code"
HOMEPAGE="https://github.com/dtolnay/syn"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	~dev-rust/proc-macro2-0.4.27:=
	~dev-rust/quote-0.6.11:=
	~dev-rust/unicode-xid-0.1.0:=
	"

src_prepare() {
	sed -i -e '/\[dev-dependencies\./,+1d' Cargo.toml || die
	rust-crate_src_prepare
}
