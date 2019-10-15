# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Query version of installled rustc compiler"
HOMEPAGE="https://github.com/Kimundi/rustc-version-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 MIT )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/semver-0.9*:=
"
