# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Cross platform smybolication"
HOMEPAGE="https://github.com/gimli-rs/addr2line"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+cpp-demangle +rustc-demangle +std-object test"
F_CPP_DEMANGLE="
	=dev-rust/cpp_demangle-0.2*:=
"
F_OBJECT="
	=dev-rust/object-0.17*:=
"
F_RUSTC_DEMANGLE="
	=dev-rust/rustc-demangle-0.1*:=
"

BDEPEND="
	=dev-rust/fallible-iterator-0.2*:=
	=dev-rust/gimli-0.20*:=[read]
	=dev-rust/lazycell-1*:=
	=dev-rust/smallvec-1*:=
	cpp-demangle? ( ${F_CPP_DEMANGLE} )
	rustc-demangle? ( ${F_RUSTC_DEMANGLE} )
	std-object? ( ${F_OBJECT} )
	test? (
		${F_CPP_DEMANGLE}
		${F_RUSTC_DEMANGLE}
		${F_OBJECT}
		( =dev-rust/backtrace-0.3*:=[libbacktrace] >=dev-rust/backtrace-0.3.13 )
		=dev-rust/clap-2*:=[color,suggestions,vec-map]
		=dev-rust/findshlibs-0.5*:=
		=dev-rust/memmap-0.7*:=
		=dev-rust/rustc-test-0.3*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-tests.patch"
)
src_prepare() {
	# Not useful here
	rm -vrf ci/ benchmark.sh bench.plot.r coverage || die
	if ! use test; then
		eapply "${FILESDIR}/${P}-no-examples.patch"
		rm -vrf examples/ || die
	fi
	default
}
src_test() {
	ADDR2LINE_FIXTURE_PATH="${CARGO_TARGET_DIR}" rust-crate_src_test
}
