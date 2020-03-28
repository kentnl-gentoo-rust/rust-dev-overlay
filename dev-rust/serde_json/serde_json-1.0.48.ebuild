# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A JSON serialization file format"
HOMEPAGE="https://github.com/serde-rs/json"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="indexmap test"

F_INDEXMAP="
	( =dev-rust/indexmap-1*:= >=dev-rust/indexmap-1.2.0 )
"
BDEPEND="
	( =dev-rust/itoa-0.4*:= >=dev-rust/itoa-0.4.3 )
	=dev-rust/ryu-1*:=
	( =dev-rust/serde-1*:= >=dev-rust/serde-1.0.100 )
	test? (
		${F_INDEXMAP}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unused-deps.patch"
)

my_dotest() {
	einfo "Testing $@"
	ecargo test --no-default-features "$@"
}
src_test() {
	# this crate requires at least "alloc" or "std"
	# to build, so as a precaution, we test each variant.
	my_dotest --features 'indexmap alloc' --lib --tests
	my_dotest --features 'indexmap std' --lib --tests

	my_dotest --features 'alloc' --lib --tests

	my_dotest --features 'arbitrary_precision alloc' --lib --tests
	my_dotest --features 'arbitrary_precision std' --lib --tests

	my_dotest --features 'default' --lib --tests

	# preserve_order needs std
	my_dotest --features 'preserve_order std' --lib --tests

	my_dotest --features 'raw_value alloc' --lib --tests
	my_dotest --features 'raw_value std' --lib --tests

	my_dotest --features 'std' --lib --tests

	my_dotest --features 'unbounded_depth alloc' --lib --tests
	my_dotest --features 'unbounded_depth std' --lib --tests

	my_dotest --all-features --lib --tests
}
