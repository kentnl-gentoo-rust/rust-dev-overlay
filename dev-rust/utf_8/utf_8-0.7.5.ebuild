# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate
ECRATE_NAME="utf-8"
DESCRIPTION="Incremental, zero copy UTF-8 decoding with error handling"
HOMEPAGE="https://github.com/SimonSapin/rust-utf8"
SRC_URI="https://crates.io/api/v1/crates/${ECRATE_NAME}/${PV}/download -> ${ECRATE_NAME}-${PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/${ECRATE_NAME}-${PV}"
src_prepare() {
	# Forces all optional deps
	rm -vrf benches/ || die
	default
}
src_install() {
	rust-crate_install "${ECRATE_NAME}" "${PV}"
}
