# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="RFC6265 Cookie storage and retrieval"
HOMEPAGE="https://github.com/pfernie/cookie_store"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="preserve-order test"

F_PRESERVE_ORDER="
	( =dev-rust/indexmap-1*:= >=dev-rust/indexmap-1.2 )
"
DEV_DEPEND="
	( =dev-rust/env_logger-0.6*:=[atty,humantime,regex,termcolor] >=dev-rust/env_logger-0.6.2 )
	( =dev-rust/pretty_assertions-0.6*:= >=dev-rust/pretty_assertions-0.6.1 )
"
BDEPEND="
	=dev-rust/cookie-0.12*:=[percent-encode]
	=dev-rust/idna-0.2*:=
	( =dev-rust/log-0.4*:= >=dev-rust/log-0.4.8 )
	( =dev-rust/publicsuffix-1*:= >=dev-rust/publicsuffix-1.5.3 )
	( =dev-rust/serde-1*:=[derive] >=dev-rust/serde-1.0.99 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_json-1.0.40 )
	( =dev-rust/time-0.1*:= >=dev-rust/time-0.1.42 )
	preserve-order? ( ${F_PRESERVE_ORDER} )
	test? (
		${F_PRESERVE_ORDER}
		${DEV_DEPEND}
	)
"
