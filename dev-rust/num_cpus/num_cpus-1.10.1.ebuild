# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Get the number of CPUs on a machine"
HOMEPAGE="https://github.com/seanmonstar/num_cpus"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.26 )
	test? (
		=dev-rust/doc-comment-0.3*:=
	)
"
src_prepare() {
	# Pulls optional deps
	rm -vrf examples/ || die
	default
}
