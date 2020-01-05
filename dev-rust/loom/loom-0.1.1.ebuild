# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Model checker for concurrent code"
HOMEPAGE="https://github.com/carllerche/loom"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="checkpoint futures generator test"
F_FUTURES="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.25 )
"
F_GENERATOR="
	( =dev-rust/generator-0.6*:= >=dev-rust/generator-0.6.10 )
"
F_CHECKPOINT="
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.80 )
	( =dev-rust/serde_derive-1*:= >=dev-rust/serde_derive-1.0.80 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_derive-1.0.33 )
"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.6 )
	( =dev-rust/scoped-tls-0.1*:= >=dev-rust/scoped-tls-0.1.2 )
	checkpoint? ( ${F_CHECKPOINT} )
	futures? ( ${F_FUTURES} )
	generator? ( ${F_GENERATOR} )
	test? (
		${F_CHECKPOINT}
		${F_FUTURES}
		${F_GENERATOR}
	)
"
src_test(){
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
