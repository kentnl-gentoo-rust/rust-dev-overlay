# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Unix Domain Socket bindings for mio"
HOMEPAGE="https://github.com/alexcrichton/mio-uds"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	=dev-rust/iovec-0.1*:=
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.42 )
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.5 )
	test? (
		=dev-rust/tempdir-0.3*:=
	)
"
