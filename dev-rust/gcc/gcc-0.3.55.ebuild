# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="Invoke a native C compiler for linking into Rust code"
HOMEPAGE="https://github.com/alex-crichton/gcc-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="bin parallel test"

F_PARALLEL="
	=dev-rust/rayon-0.8*:=
"
DEV_DEPENDS="
	=dev-rust/tempdir-0.3*:=
"
BDEPEND="
	bin? (
		${F_PARALLEL}
		${DEV_DEPENDS}
	)
	parallel? ( ${F_PARALLEL} )
	test? (
		${F_PARALLEL}
		${DEV_DEPENDS}
	)
"

src_prepare() {
	if ! use bin && ! use test; then
		# pulls in all opt-deps and dev-deps
		rm -vrf src/bin/ || die
	fi
	default
}
src_compile() {
	rust-crate_src_compile
	if use bin; then
		RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" ecargo build --bins
	fi
}
src_test() {
	# Actual tests broken 
	# # https://github.com/alexcrichton/cc-rs/issues/444
	RUSTFLAGS="${RUSTFLAGS} --cap-lints warn" ecargo build --tests --bins
}
src_install() {
	rust-crate_src_install
	if use bin; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/debug/gcc-shim"
	fi
}
crate_symlinks() {
	use bin || return 0
	# Note: +( ) is a bash ext-glob feature
	# which allows "one-or-more-of" semantics of the included expressions.
	# and this is far superior to using
	#  {[0-9],[0-9][0-9],[0-9][0-9][0-9]}
	# or something equally horrible to match one, two, and 3 digit integers.
	(
	shopt -s extglob
	alternatives_auto_makesym "/usr/bin/gcc-shim" \
		"/usr/lib/rust/binaries/@(cc|gcc)-+([0-9]).+([0-9]).+([0-9])/gcc-shim"
	)
}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
