# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="A snapshot testing library for Rust"
HOMEPAGE="https://github.com/mitsuhiko/insta"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	( =dev-rust/chrono-0.4*:=[serde,clock] >=dev-rust/chrono-0.4.6 )
	( =dev-rust/ci_info-0.3*:= >=dev-rust/ci_info-0.3.1 )
	( =dev-rust/console-0.7*:= >=dev-rust/console-0.7.5 )
	=dev-rust/difference-2*:=
	( =dev-rust/failure-0.1*:= >=dev-rust/failure-0.1.5 )
	( =dev-rust/lazy_static-1*:= >=dev-rust/lazy_static-1.2.0 )
	( =dev-rust/pest-2*:= >=dev-rust/pest-2.1.0 )
	( =dev-rust/pest_derive-2*:= >=dev-rust/pest_derive-2.1.0 )
	( =dev-rust/ron-0.4*:= >=dev-rust/ron-0.4.1 )
	( =dev-rust/serde-1*:=[derive] >=dev-rust/serde-1.0.85 )
	( =dev-rust/serde_json-1*:= >=dev-rust/serde_json-1.0.36 )
	( =dev-rust/serde_yaml-0.8*:= >=dev-rust/serde_yaml-0.8.8 )
	( =dev-rust/uuid-0.7*:=[serde,v4] >=dev-rust/uuid-0.7.1 )
"
