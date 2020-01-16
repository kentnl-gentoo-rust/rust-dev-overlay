# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate

DESCRIPTION="Adapters between compression crates and Rust's modern async IO types"
HOMEPAGE="https://github.com/rustasync/async-compression"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="|| ( MIT Apache-2.0 )"
KEYWORDS="~amd64 ~x86"
IUSE="all all-algorithms all-implementations brotli bzip2 deflate futures-bufread futures-write gzip stream zlib zstd"
F_BROTLI="
	( =dev-rust/brotli2-0.3*:= >=dev-rust/brotli2-0.3.2 )
"
F_BZIP2="
	( =dev-rust/bzip2-0.3*:= >=dev-rust/bzip2-0.3.2 )
"
F_FLATE2="
	( =dev-rust/flate2-1*:=[rust-backend] >=dev-rust/flate2-1.0.11 )
"
F_FUTURES_IO="
	=dev-rust/futures-io-0.3*:=
"
F_DEFLATE="${F_FLATE2}"
F_FUTURES_BUFREAD="${F_FUTURES_IO}"
F_FUTURES_WRITE="${F_FUTURES_IO}"
F_GZIP="${F_FLATE2}"
F_STREAM="
	=dev-rust/bytes-0.5*:=
"
F_ZLIB="${F_FLATE2}"
F_ZSTD="
	=dev-rust/zstd-0.5*:=
	=dev-rust/zstd-safe-2*:=
"
F_ALL_IMPLEMENTATIONS="
	${F_FUTURES_BUFREAD}
	${F_FUTURES_WRITE}
	${F_STREAM}
"
F_ALL_ALGORITHMS="
	${F_BROTLI}
	${F_BZIP2}
	${F_DEFLATE}
	${F_GZIP}
	${F_ZLIB}
	${F_ZSTD}
"
F_ALL="
	${F_ALL_IMPLEMENTATIONS}
	${F_ALL_ALGORITHMS}
"
DEV_DEPEND="
	=dev-rust/futures-0.3*:=[async-await,executor,std]
	=dev-rust/futures-test-0.3*:=[std]
	( =dev-rust/ntest-0.3*:= >=dev-rust/ntest-0.3.3 )
	( =dev-rust/proptest-0.9*:=[bit-set,fork,std,timeout] >=dev-rust/proptest-0.9.4 )
	( =dev-rust/proptest-derive-0.1*:= >=dev-rust/proptest-derive-0.1.2 )
	( =dev-rust/rand-0.7*:=[std] >=dev-rust/rand-0.7.2 )
	( =dev-rust/timebomb-0.1*:= >=dev-rust/timebomb-0.1.2 )
"
BDEPEND="
	=dev-rust/futures-core-0.3*:=
	( =dev-rust/memchr-2*:= >=dev-rust/memchr-2.2.1 )
	( =dev-rust/pin-project-lite-0.1*:= >=dev-rust/pin-project-lite-0.1.1 )
	brotli? ( ${F_BROTLI} )
	bzip2? ( ${F_BZIP2} )
	deflate? ( ${F_DEFLATE} )
	futures-bufread? ( ${F_FUTURES_BUFREAD} )
	futures-write? ( ${F_FUTURES_WRITE} )
	gzip? ( ${F_GZIP} )
	stream? ( ${F_STREAM} )
	zlib? ( ${F_ZLIB} )
	zstd? ( ${F_ZSTD} )
	all-algorithms? ( ${F_ALL_ALGORITHMS} )
	all-implementations? ( ${F_ALL_IMPLEMENTATIONS} )
	all? (
		${F_ALL_ALGORITMS}
		${F_ALL_IMPLEMENTATIONS}
	)
	test? (
		${DEV_DEPEND}
		${F_ALL}
	)
"
