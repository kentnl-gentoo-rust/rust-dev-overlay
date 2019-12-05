# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Timer facilities for Tokio"
HOMEPAGE="https://github.com/tokio-rs/tokio"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

DEV_DEPENDS="
	=dev-rust/rand-0.7*:=
	( =dev-rust/tokio-0.1*:= >=dev-rust/tokio-0.1.7 )
	=dev-rust/tokio-mock-task-0.1*:=
"
BDEPEND="
	=dev-rust/crossbeam-utils-0.6*:=
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.19 )
	( =dev-rust/slab-0.4*:= >=dev-rust/slab-0.4.1 )
	( =dev-rust/tokio-executor-0.1*:= >=dev-rust/tokio-executor-0.1.1 )
"
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
