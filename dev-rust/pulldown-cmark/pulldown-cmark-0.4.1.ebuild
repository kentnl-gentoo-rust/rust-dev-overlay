# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="A pull parser for CommonMark"
HOMEPAGE="https://github.com/raphlinus/pulldown-cmark"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="bin test"

F_GETOPTS="
	=dev-rust/getopts-0.2*:=
"
DEV_DEPEND="
	=dev-rust/html5ever-0.22*:=
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.3 )
	( =dev-rust/regex-1*:=[perf-literal,perf-cache] >=dev-rust/regex-1.1 )
	=dev-rust/tendril-0.4*:=
"
BDEPEND="
	=dev-rust/bitflags-1*:=
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2.0 )
	( =dev-rust/unicase-2*:= >=dev-rust/unicase-2.2.0 )
	bin? ( ${F_GETOPTS} ${DEV_DEPEND} )
	test? (
		${F_GETOPTS}
		${DEV_DEPEND}
	)
"

src_prepare() {
	rm -vrf benches/ examples/ || die
	if ! use test; then
		if ! use bin; then
			eapply "${FILESDIR}/${P}-nobin.patch"
			rm -vf src/main.rs || die
		fi
	fi
	default
}

src_compile() {
	rust-crate_src_compile
	if use bin; then
		ecargo build --release --bins
	fi
}
src_install() {
	rust-crate_src_install
	if use bin; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/release/pulldown-cmark"
	fi
}
crate_symlinks() {
	use bin || return 0
	alternatives_auto_makesym "/usr/bin/pulldown-cmark" \
		"/usr/lib/rust/binaries/pulldown-cmark-[0-9].[0-9].[0-9]/pulldown-cmark"

}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
