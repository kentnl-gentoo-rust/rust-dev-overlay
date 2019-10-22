# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
ECRATE_VERSION="${PV}+1.1.1d"
DESCRIPTION="Source of OpenSSL and logic to build it"
HOMEPAGE="https://github.com/alexcrichton/openssl-src-rs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${ECRATE_VERSION}/download -> ${PN}-${ECRATE_VERSION}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
BDEPEND="
	=dev-rust/cc-1*:=
"
S="${WORKDIR}/${PN}-${ECRATE_VERSION}"

src_install() {
	rust-crate_install "${PN}" "${ECRATE_VERSION}"
}
