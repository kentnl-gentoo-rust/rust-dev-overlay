# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Bindings for libgit2 for interacting with git repositories"
HOMEPAGE="https://github.com/rust-lang/git2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+https +ssh vendored-openssl test"

F_OPENSSL_PROBE="
	=dev-rust/openssl-probe-0.1*:=
"
F_OPENSSL_SYS="
	=dev-rust/openssl-sys-0.9*:=
"
F_HTTPS="
	${F_OPENSSL_PROBE}
	${F_OPENSSL_SYS}
"
BDEPEND="
	( =dev-rust/bitflags-1*:= >=dev-rust/bitflags-1.1.0 )
	=dev-rust/libc-0.2*:=
	(
		=dev-rust/libgit2-sys-0.10*:=[https?,ssh?]
		test? ( =dev-rust/libgit2-sys-0.10*:=[https,ssh] )
	)
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.8 )
	=dev-rust/url-2*:=
	https? ( ${F_HTTPS} )
	vendored-openssl? (
		${F_OPENSSL_SYS}
		=dev-rust/openssl-sys-0.9*:=[vendored]
	)
	test? (
		${F_HTTPS}
		=dev-rust/openssl-sys-0.9*:=[vendored]
		( =dev-rust/tempfile-3*:= >=dev-rust/tempfile-3.1.0 )
		( =dev-rust/thread-id-3*:= >=dev-rust/thread-id-3.3.0 )
		( =dev-rust/time-0.1*:= >=dev-rust/time-0.1.39 )
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-example-deps.patch"
)
src_prepare() {
	rm -vrf examples/ || die
	default
}
src_test() {
	# stupid upstream makes warnings fatal
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
