# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="Automatically generate Rust FFI bindings for C and C++ libraries"
HOMEPAGE="https://github.com/rust-lang/rust-bindgen"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="bin +logging test +which-rustfmt"

F_LOGGING="
	=dev-rust/env_logger-0.6*:=[atty,humantime,regex,termcolor]
	=dev-rust/log-0.4*:=
"
F_WHICH_RUSTFMT="
	=dev-rust/which-3*:=
"
F_BIN="
	=dev-rust/clap-2*:=[color,suggestions,vec-map]
	=dev-rust/diff-0.1*:=
"
BDEPEND="
	( =dev-rust/bitflags-1*:= >=dev-rust/bitflags-1.0.3 )
	( =dev-rust/cexpr-0.3*:= >=dev-rust/cexpr-0.3.3 )
	=dev-rust/cfg-if-0.1*:=
	=dev-rust/clang-sys-0.28*:=[runtime]
	=dev-rust/lazy_static-1*:=
	( =dev-rust/peeking_take_while-0.1*:= >=dev-rust/peeking_take_while-0.1.2 )
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/regex-1*:=[perf-literal,perf-cache]
	( =dev-rust/rustc-hash-1*:= >=dev-rust/rustc-hash-1.0.1 )
	=dev-rust/shlex-0.1*:=
	bin? (
		${F_BIN}
		${F_LOGGING}
		${F_WHICH_RUSTFMT}
	)
	logging? ( ${F_LOGGING} )
	which-rustfmt? ( ${F_WHICH_RUSTFMT} )
	test? (
		${F_LOGGING}
		${F_WHICH_RUSTFMT}
		${F_BIN}
	)
"
src_prepare() {
	if ! use bin; then
		eapply "${FILESDIR}/${P}-nobin.patch"
		rm -vf src/main.rs || die
	fi
	default
}

src_compile() {
	rust-crate_src_compile
	if use bin; then
		ecargo build --bins
	fi
}
src_install() {
	rust-crate_src_install
	if use bin; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/debug/bindgen"
	fi
}
crate_symlinks() {
	use bin || return 0
	(
		# Note: +( ) is a bash ext-glob feature
		# which allows "one-or-more-of" semantics of the included expressions.
		# and this is far superior to using
		#  {[0-9],[0-9][0-9],[0-9][0-9][0-9]}
		# or something equally horrible to match one, two, and 3 digit integers.
		shopt -s extglob
		alternatives_auto_makesym "/usr/bin/bindgen" \
			"/usr/lib/rust/binaries/bindgen-+([0-9]).+([0-9]).+([0-9])/bindgen"
	)

}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
