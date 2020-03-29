# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Determine displayed width of 'char' and 'str' with to Unicode Annex #11"
HOMEPAGE="https://github.com/unicode-rs/unicode-width"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=(
	"${FILESDIR}/${PN}-0.1.6-no-nightly-cargo.patch"
)
src_prepare() {
	rm -vrf scripts/ || die
	default
}
my_test() {
	einfo "Testing $(printf "%q " "$@")"
	ecargo test "$@"
}
src_test() {
	my_test --no-default-features

	# my_test --no-default-features --features 'bench' # nightly
	my_test --no-default-features --features 'default'
	my_test --no-default-features --features 'no_std'

	# --all-features
	my_test --no-default-features --features 'default no_std'

}
