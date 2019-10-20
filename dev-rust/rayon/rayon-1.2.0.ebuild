# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Simple work-stealing parallelism for Rust"
HOMEPAGE="https://github.com/rayon-rs/rayon"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	=dev-rust/crossbeam-deque-0.7*:=
	=dev-rust/either-1*:=
	( =dev-rust/rayon-core-1*:= >=dev-rust/rayon-core-1.6.0 )
	test? (
		=dev-rust/doc-comment-0.3*:=
		=dev-rust/lazy_static-1*:=
		=dev-rust/rand-0.6*:=[std]
		=dev-rust/rand_xorshift-0.1*:=
		=dev-rust/serde-1*:=
		=dev-rust/serde_derive-1*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-no-example-deps.patch"
)
src_prepare() {
	# Pulls extra deps
	rm -vrf examples/ || die
	default
}
