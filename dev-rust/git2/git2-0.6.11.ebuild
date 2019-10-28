# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Bindings for libgit2 for interacting with git repositories"
HOMEPAGE="https://github.com/alexcrichton/git2-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+curl +https +ssh test"

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
	=dev-rust/bitflags-0.9*:=
	=dev-rust/libc-0.2*:=
	(
		=dev-rust/libgit2-sys-0.6*:=[curl?,https?,ssh?] >=dev-rust/libgit2-sys-0.6.19
		test? ( dev-rust/libgit2-sys[curl,https,ssh] )
	)
	=dev-rust/url-1*:=
	https? ( ${F_HTTPS} )
	test? (
		=dev-rust/tempdir-0.3*:=
		=dev-rust/time-0.1*:=
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
