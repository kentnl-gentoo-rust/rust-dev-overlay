# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
DESCRIPTION="Web PKI X.509 Certificate Verification"
HOMEPAGE="https://github.com/briansmith/webpki"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="ISC BSD"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/ring-0.16*:=[dev-urandom-fallback] >=dev-rust/ring-0.16.10 )
	=dev-rust/untrusted-0.7*:=
	test? (
		( =dev-rust/base64-0.9* >=dev-rust/base64-0.9.1 )
	)
"
PATCHES=(
	"${FILESDIR}/${PN}-0.21.0-broken-test.patch"
)
src_test() {
	local targets=(
		'default'
		'std'
		'trust_anchor_util'
	)
	for i in "${targets[@]}"; do
		einfo "Testing --features '$i'"
		ecargo test --no-default-features --features "${i}"
	done
	einfo "Testing --all-features"
	ecargo test --all-features
}
