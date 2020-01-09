# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Permutation testing for concurrent code"
HOMEPAGE="https://github.com/tokio-rs/loom"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="checkpoint futures test"
F_FUTURES="
	=dev-rust/futures-util-0.3*:=[async-await-macro,std]
"
F_CHECKPOINT="
	( =dev-rust/serde-1*:=[derive] >=dev-rust/serde-1.0.92 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_derive-1.0.33 )
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.6 )
	( =dev-rust/generator-0.6*:= >=dev-rust/generator-0.6.18 )
	( =dev-rust/scoped-tls-0.1*:= >=dev-rust/scoped-tls-0.1.2 )
	checkpoint? ( ${F_CHECKPOINT} )
	futures? ( ${F_FUTURES} )
	test? (
		${F_CHECKPOINT}
		${F_FUTURES}
	)
"
