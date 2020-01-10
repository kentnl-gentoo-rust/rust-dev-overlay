# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Bindings to libbzip2 for bzip2 (de)compression as Reader/Writer streams"
HOMEPAGE="https://github.com/alexcrichton/bzip2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test tokio"
F_TOKIO="
	=dev-rust/futures-0.1*:=
	=dev-rust/tokio-io-0.1*:=
"
DEV_DEPEND="
	( =dev-rust/partial-io-0.2*:=[quickcheck] >=dev-rust/partial-io-0.2.1 )
	=dev-rust/quickcheck-0.4*:=[use-logging]
	=dev-rust/rand-0.3*:=
	=dev-rust/tokio-core-0.1*:=
"
BDEPEND="
	=dev-rust/bzip2-sys-0.1*:=
	=dev-rust/libc-0.2*:=
	tokio? ( ${F_TOKIO} )
	test? (
		${DEV_DEPEND}
		${F_TOKIO}
	)
"
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
