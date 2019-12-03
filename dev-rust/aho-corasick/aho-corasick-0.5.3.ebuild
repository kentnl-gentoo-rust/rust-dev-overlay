# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="Fast multiple substring searching"
HOMEPAGE="https://github.com/BurntSushi/aho-corasick"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Unlicense )"
KEYWORDS="~amd64 ~x86"
IUSE="dot test"
BDEPEND="
	( =dev-rust/memchr-0.1*:= >=dev-rust/memchr-0.1.9 )
	test? (
		=dev-rust/quickcheck-0.2*:=
		=dev-rust/rand-0.3*:=
	)
"
src_prepare() {
	rm -vrf examples/ || die
	rm -vrf benches/ || die
	eapply "${FILESDIR}/${P}-no-example-deps.patch"
	if ! use test; then
		if use dot; then
			eapply "${FILESDIR}/${P}-no-test-binaries.patch"
		else
			rm -vrf src/main.rs || die
			eapply "${FILESDIR}/${P}-no-binaries.patch"
		fi
	fi
	default
}

src_compile() {
	rust-crate_src_compile
	if use dot; then
		ecargo build --release --bins
	fi
}
src_install() {
	rust-crate_src_install
	if use dot; then
		exeinto "/usr/lib/rust/binaries/${P}"
		doexe "${CARGO_TARGET_DIR}/release/aho-corasick-dot"
	fi
}
crate_symlinks() {
	use dot || return 0
	alternatives_auto_makesym "/usr/bin/aho-corasick-dot" \
		"/usr/lib/rust/binaries/aho-corasick-[0-9].[0-9].[0-9]/aho-corasick-dot"

}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
