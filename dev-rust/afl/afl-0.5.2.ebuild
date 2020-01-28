# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="Fuzzing rust code with american-fuzzy-lop"
HOMEPAGE="https://github.com/rust-fuzz/afl.rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="cargo-afl"
BDEPEND="
	=dev-rust/cc-1*:=
	( =dev-rust/clap-2*:=[color,suggestions,vec-map] >=dev-rust/clap-2.29 )
	=dev-rust/rustc_version-0.2*:=
	( =dev-rust/xdg-2*:= >=dev-rust/xdg-2.1 )
"
QA_PREBUILT=(
	"/usr/lib/rust/crates/*/afl-*/testcases/others/elf/*.elf"
)
src_prepare() {
	if ! use cargo-afl; then
		eapply "${FILESDIR}/${P}-nobin.patch"
		rm -rvf src/bin || die
	fi
	# Both needlessly bloat install image
	# and emit many QA violations due to prestripped binaries
	# But not all can be removed because it breaks compile :(
	rm -vrf afl-2.52b/docs/{visualization,vuln_samples} || die
	rm -vrf afl-2.52b/experimental || die
	rm -vrf etc/ || die
	default
}
src_compile() {
	rust-crate_src_compile
	if use cargo-afl; then
		ecargo build --bins
	fi
}
src_install() {
	rust-crate_src_install
	if use cargo-afl; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/debug/cargo-afl"
	fi
}
crate_symlinks() {
	use cargo-afl || return 0
	(
		shopt -s extglob
		alternatives_auto_makesym "/usr/bin/cargo-afl" \
			"/usr/lib/rust/binaries/afl-+([0-9]).+([0-9]).+([0-9])/cargo-afl"
	)
}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
