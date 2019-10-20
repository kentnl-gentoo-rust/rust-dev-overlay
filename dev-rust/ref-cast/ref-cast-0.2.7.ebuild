# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Safely cast &T to &U where struct U contains a single field of type T"
HOMEPAGE="https://github.com/dtolnay/ref-cast"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	~dev-rust/ref-cast-impl-0.2.7:=
	test? (
		=dev-rust/rustversion-0.1*:=
		=dev-rust/trybuild-1*:=
	)
"
