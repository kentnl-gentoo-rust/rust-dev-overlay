# Copyright 2019 Gentoo Authors
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
	=dev-rust/object-0.12*:=
"
F_RUSTC_DEMANGLE="
	=dev-rust/rustc-demangle-0.1*:=
"

BDEPEND="
	=dev-rust/fallible-iterator-0.2*:=
	=dev-rust/gimli-0.19*:=
	=dev-rust/intervaltree-0.2*:=
	=dev-rust/lazycell-1*:=
	=dev-rust/smallvec-0.6*:=
	cpp-demangle? ( ${F_CPP_DEMANGLE} )
	rustc-demangle? ( ${F_RUSTC_DEMANGLE} )
	std-object? ( ${F_OBJECT} )
	test? (
		${F_CPP_DEMANGLE}
		${F_RUSTC_DEMANGLE}
		${F_OBJECT}
		( =dev-rust/backtrace-0.3*:=[libbacktrace] >=dev-rust/backtrace-0.3.13 )
		=dev-rust/findshlibs-0.5*:=
		=dev-rust/memmap-0.7*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-broken-test.patch"
)
src_prepare() {
	# Not useful here
	rm -vrf ci/ benchmark.sh bench.plot.r coverage || die
	# Bug: https://github.com/gimli-rs/addr2line/issues/154
	# Bug: https://bugs.gentoo.org/703470
	rm -vrf tests/output_equivalence.rs || die
	rm -vrf examples/ || die
	default
}
