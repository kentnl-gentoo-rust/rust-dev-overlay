# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Async{Read,Write,Seek,BufRead} traits for 'futures'"
HOMEPAGE="https://github.com/rust-lang/futures-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

src_test() {
	local targets=(
		''
		'default'
		'read-initializer unstable'
		'std'
		'unstable'
		# --all-features implies nightly due to
		# read-initializer + std -> features(read_initializer)
		'default std unstable'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '${i}'"
		ecargo test --no-default-features --features "${i}"
	done
}
