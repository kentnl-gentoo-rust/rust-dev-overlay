# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="ELF, Mach-o and PE binary parsing and loading"
HOMEPAGE="https://github.com/m4b/goblin"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="+alloc test"

# Note: 
# Any crates that want any of these features:
#  alloc archive endian_fd mach32 mach64 pe32 pe64 std
# Should require USE="alloc"
#Normally I'd consider exporting each of those features
# as USE flags, but here its just excesive to have 8 flags that all just enable the same dependency
F_ALLOC="
	=dev-rust/scroll-0.10*:=[derive]
	=dev-rust/log-0.4*:=
"
BDEPEND="
	alloc? ( ${F_ALLOC} )
	( =dev-rust/plain-0.2*:= >=dev-rust/plain-0.2.3 )
	=dev-rust/scroll-0.10*:=
	test? ( ${F_ALLOC} )
"
PATCHES=(
	"${FILESDIR}/${PN}-0.0.22-broken-tests.patch"
)
src_prepare() {
	# Pulls dev-deps and optional deps
	rm -vrf examples/ || die
	default
}
