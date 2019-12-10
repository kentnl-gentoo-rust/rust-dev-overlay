# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Async process management backed futures"
HOMEPAGE="https://github.com/alexcrichton/tokio-process"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/futures-0.1*:= >=dev-rust/futures-0.1.11 )
	=dev-rust/tokio-io-0.1*:=
	=dev-rust/tokio-reactor-0.1*:=
	( =dev-rust/crossbeam-queue-0.1*:= >=dev-rust/crossbeam-queue-0.1.2 )
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.3 )
	=dev-rust/libc-0.2*:=
	=dev-rust/log-0.4*:=
	( =dev-rust/mio-0.6*:= >=dev-rust/mio-0.6.5 )
	( =dev-rust/tokio-signal-0.2*:= >=dev-rust/tokio-signal-0.2.5 )
	test? (
		=dev-rust/failure-0.1*:=[std,derive]
		=dev-rust/log-0.4*:=
		=dev-rust/tokio-0.1*:=[rt-full]
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
src_prepare() {
	use test || rm -vr src/bin || die
	default
}
#src_test() {
#	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
#}
