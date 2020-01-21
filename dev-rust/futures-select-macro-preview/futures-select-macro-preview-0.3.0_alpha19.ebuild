# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Definition of the select! macro to handle the first of many futures to complete"
HOMEPAGE="https://github.com/rust-lang-nursery/futures-rs"
MY_ALPHA="$(ver_cut 4-)"
MY_PV="$(ver_cut 0-3)-alpha.${MY_ALPHA##alpha}"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${MY_PV}/download -> ${PN}-${MY_PV}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	( =dev-rust/proc-macro-hack-0.5*:= >=dev-rust/proc-macro-hack-0.5.9 )
	=dev-rust/proc-macro2-1*:=
	=dev-rust/quote-1*:=
	=dev-rust/syn-1*:=[printing,proc-macro]
"
S="${WORKDIR}/${PN}-${MY_PV}"
src_install() {
	rust-crate_install "${PN}" "${MY_PV}"
}
