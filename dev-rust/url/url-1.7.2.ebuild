# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="URL library for rust, based on the WHATWG URL Standard"
HOMEPAGE="https://github.com/servo/rust-url"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="heap-size query-encoding rustc-serialize serde"
RESTRICT="test"
F_ENCODING="
	=dev-rust/encoding-0.2*:=
"
F_HEAPSIZE="
	( >=dev-rust/heapsize-0.4.1:= <dev-rust/heapsize-0.5 )
"
F_RUSTC_SERIALIZE="
	=dev-rust/rustc-serialize-0.3*:=
"
F_SERDE="
	( >=dev-rust/serde-0.6.1:= <dev-rust/serde-0.9 )
"
BDEPEND="
	=dev-rust/idna-0.1*:=
	=dev-rust/matches-0.1*:=
	=dev-rust/percent-encoding-1*:=
	heap-size? ( ${F_HEAPSIZE} )
	query-encoding? ( ${F_ENCODING} )
	rustc-serialize? ( ${F_RUSTC_SERIALIZE} )
	serde? ( ${F_SERDE} )
"
