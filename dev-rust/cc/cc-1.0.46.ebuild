# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Invoke a native C compiler for linking into Rust code"
HOMEPAGE="https://github.com/rust-lang-nursery/alex-crichton/cc-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

F_JOBSERVER="
	( =dev-rust/jobserver-0.1*:= >=dev-rust/jobserver-0.1.16 )
	( =dev-rust/num_cpus-1*:= >=dev-rust/num_cpus-1.10 )
"
RESTRICT="test"
BDEPEND=""

src_prepare() {
	# pulls in all opt-deps and dev-deps
	rm -vrf src/bin/ || die
	default
}
