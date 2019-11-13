# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="A Rust text diffing and assertion library"
HOMEPAGE="https://github.com/johannhof/difference.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="bin"

DEV_DEPENDS="
	=dev-rust/quickcheck-0.4*:=
	( =dev-rust/term-0.2* >=dev-rust/term-0.2.7 )
"
F_BIN="
	=dev-rust/getopts-0.2*:=
"
BDEPEND="
	bin? (
		${F_BIN}
		${DEV_DEPENDS}
	)
	test? (
		${F_BIN}
		${DEV_DEPENDS}
	)
"

src_prepare() {
	# not useful in crate
	rm -vrf assets/ || die
	# pulls dev-depends
	rm -vrf examples/ || die
	if ! use bin; then
		# also pulls dev-depends :(
		rm src/main.rs || die
		eapply "${FILESDIR}/${P}-nobin-cargo.patch"
	fi
	default
}
src_compile() {
	rust-crate_src_compile
	if use bin; then
		RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" ecargo build --release --bins --features=bin
	fi
}
src_test() {
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" rust-crate_src_test
}
src_install() {
	rust-crate_src_install
	if use bin; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/release/difference"
	fi
}
crate_symlinks() {
	use bin || return 0
	alternatives_auto_makesym "/usr/bin/difference" \
		"/usr/lib/rust/binaries/difference-[0-9].[0-9].[0-9]/difference"

}
pkg_postinst () {
	crate_symlinks
}
pkg_postrm () {
	crate_symlinks
}
