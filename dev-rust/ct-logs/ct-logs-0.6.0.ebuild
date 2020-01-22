# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Googles list of Certificate Transparency logs for use with sct"
HOMEPAGE="https://github.com/ctz/ct-logs"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( Apache-2.0 ISC MIT )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	=dev-rust/sct-0.6*:=
"
