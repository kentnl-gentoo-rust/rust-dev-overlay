# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A snapshot testing library for Rust"
HOMEPAGE="https://github.com/mitsuhiko/insta"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="redactions ron"

F_REDACTIONS="
	( =dev-rust/pest-2*:= >=dev-rust/pest-2.1.0 )
	( =dev-rust/pest_derive-2*:= >=dev-rust/pest_derive-2.1.0 )
"
F_RON="
	( =dev-rust/ron-0.5*:= >=dev-rust/ron-0.5.1 )
"
BDEPEND="
	=dev-rust/console-0.9*:=
	=dev-rust/difference-2*:=
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.4.0 )
	( =dev-rust/serde-1*:=[derive] >=dev-rust/serde-1.0.85 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_json-1.0.36 )
	( =dev-rust/serde_yaml-0.8*:= >=dev-rust/serde_yaml-0.8.8 )
	( =dev-rust/uuid-0.8*:=[serde,v4] >=dev-rust/uuid-0.8.1 )
	redactions? ( ${F_REDACTIONS} )
	ron? ( ${F_RON} )
	test? (
		${F_REDACTIONS}
		${F_RON}
	)
"
