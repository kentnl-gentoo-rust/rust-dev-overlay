# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Acquire a stack trace(backtrace) at runtime in a Rust program"
HOMEPAGE="https://github.com/rust-lang/backtrace-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="cpp-demangle gimli-symbolize serialize-rustc serialize-serde test +libbacktrace"

F_CPP_DEMANGLE="
	( =dev-rust/cpp_demangle-0.2*:= >=dev-rust/cpp_demangle-0.2.3 )
"
F_GIMLI_SYMBOLIZE="
	=dev-rust/addr2line-0.11*:=
	=dev-rust/findshlibs-0.5*:=
	( =dev-rust/goblin-0.1*:=[alloc] >=dev-rust/goblin-0.1.3 )
	=dev-rust/memmap-0.7*:=
"
F_RUSTC_SERIALIZE="
	=dev-rust/rustc-serialize-0.3*:=
"
F_SERDE="
	=dev-rust/serde-1*:=[derive]
"
F_LIBBACKTRACE="
	( =dev-rust/backtrace-sys-0.1*:= >=dev-rust/backtrace-sys-0.1.32 )

"
BDEPEND="
	( =dev-rust/cfg-if-0.1*:= >=dev-rust/cfg-if-0.1.10 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.45 )
	( =dev-rust/rustc-demangle-0.1*:= >=dev-rust/rustc-demangle-0.1.4 )
	cpp-demangle? ( ${F_CPP_DEMANGLE} )
	libbacktrace? ( ${F_LIBBACKTRACE} )
	gimli-symbolize? ( ${F_GIMLI_SYMBOLIZE} )
	serialize-rustc? ( ${F_RUSTC_SERIALIZE} )
	serialize-serde? ( ${F_SERDE} )
	test? (
		${F_CPP_DEMANGLE}
		${F_LIBBACKTRACE}
		${F_GIMLI_SYMBOLIZE}
		${F_RUSTC_SERIALIZE}
		${F_SERDE}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-decruft.patch"
)
src_prepare() {
	# Decruft
	rm -vrf .github/ benches/ ci/ examples/ || die
	default
}
src_test() {
	local targets=(
		''
		'addr2line'
		'backtrace-sys'
		# Patched out
		# 'compiler_builtins'
		# 'core'
		'cpp_demangle'
		'findshlibs'
		'goblin'
		'memmap'
		'rustc-serialize'
		'serde'

		'coresymbolication'
		'dbghelp'
		'default'
		'dladdr'
		'gimli-symbolize'
		'kernel32'
		'libbacktrace'
		'libunwind'
		# patched out
		# 'rustc-dep-of-std'
		'serialize-rustc'
		'serialize-serde'
		'std'
		'unix-backtrace'
		# patched out
		# 'verify-winapi'

		# libunwind + gimli-symbolize don't play well together
		# nor do unix-backtrace + gimli-symbolize
		# approximating --all-features
		# https://bugs.gentoo.org/710380
		'libunwind addr2line backtrace-sys cpp_demangle findshlibs goblin memmap rustc-serialize serde coresymbolication dbghelp default dladdr kernel32 libbacktrace serialize-rustc serialize-serde std unix-backtrace'
		'gimli-symbolize addr2line backtrace-sys cpp_demangle findshlibs goblin memmap rustc-serialize serde coresymbolication dbghelp dladdr kernel32 libbacktrace serialize-rustc serialize-serde std'

	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
}
