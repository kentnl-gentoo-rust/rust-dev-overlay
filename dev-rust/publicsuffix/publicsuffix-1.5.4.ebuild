# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Robust domain name parsing and RFC email address validation"
HOMEPAGE="https://github.com/rushmorem/publicsuffix"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="+remote-list test"

DEV_DEPEND="
	~dev-rust/rspec-1.0.0_beta3:=
"
F_REMOTE_LIST="
	=dev-rust/native-tls-0.2*:=
"
BDEPEND="
	=dev-rust/error-chain-0.12*:=
	=dev-rust/idna-0.2*:=
	=dev-rust/lazy_static-1*:=
	=dev-rust/regex-1*:=
	=dev-rust/url-2*:=
	remote-list? ( ${F_REMOTE_LIST} )
	test? (
		${DEV_DEPEND}
		${F_REMOTE_LIST}
	)
"
PATCHES=(
	"${FILESDIR}/${P}-network-tests.patch"
)
src_prepare() {
	# cruft files
	rm -rvf .travis.yml benches/ || die
	default
}
