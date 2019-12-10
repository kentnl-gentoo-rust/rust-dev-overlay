# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="An implementation of the GNU make jobserver for Rust"
HOMEPAGE="https://github.com/alexchrichton/jobserver-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="test"
BDEPEND="
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.6 )
	( =dev-rust/libc-0.2*:= >=dev-rust/libc-0.2.50 )
	test? (
		=dev-rust/futures-0.1*:=
		=dev-rust/num_cpus-1*:=
		=dev-rust/tempdir-0.3*:=
		=dev-rust/tokio-core-0.1*:=
		=dev-rust/tokio-process-0.2*:=
	)
"
PATCHES=(
	"${FILESDIR}/${P}-unix-cargo.patch"
)
