# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Serialization framework for Rust"
HOMEPAGE="https://serde.rs"
SRC_URI="https://crates.io/api/v1/crates/serde/1.0.89/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	~dev-rust/serde_derive-1.0.89:=
"

src_prepare() {
	sed -i -e '/\[dev-dependencies\]/,+1d' Cargo.toml || die
	rust-crate_src_prepare
}
