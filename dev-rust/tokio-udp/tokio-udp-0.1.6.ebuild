# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="UDP bindings for Tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/bytes-0.4*:=
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	=dev-rust/log-0.4*:=
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.14 )
	=dev-rust/tokio-codec-0.1*:=
	( =dev-rust/tokio-io-0.1*:= >=dev-rust/tokio-io-0.1.7 )
	( =dev-rust/tokio-reactor-0.1*:= >=dev-rust/tokio-reactor-0.1.1 )
	test? (
		=dev-rust/env_logger-0.6*:=
	)
"
