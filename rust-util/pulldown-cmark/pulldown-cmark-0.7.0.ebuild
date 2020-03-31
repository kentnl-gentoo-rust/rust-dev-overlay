# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rust-crate alternatives

DESCRIPTION="A pull parser for CommonMark"
HOMEPAGE="https://github.com/raphlinus/pulldown-cmark"
SRC_URI="https://crates.io/api/v1/crates/${PN}/${PV}/download -> ${P}.crate"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE="examples"
BDEPEND="
	=dev-rust/getopts-0.2*:=
	=dev-rust/pulldown-cmark-0.7*:=[-bin(-)]
"
BIN_NAMES=(
	"pulldown-cmark"
)
EXAMPLE_NAMES=(
	"event-filter"
	"string-to-string"
)

src_prepare() {
	rm -rf benches/ tests/ || die
	rm -f build.rs || die
	for file in src/*; do
		[[ "${file}" == "src/main.rs" ]] && continue
		rm -f "${file}" || die
	done
	eapply "${FILESDIR}/${P}-binary-conversion.patch"
	default
}
src_compile() {
	local targets=(
		'--bins'
	)
	use examples && targets+=( '--examples' )
	PATH="${PATH}:${WORKDIR}/bin" ecargo install --path '.' --root "${WORKDIR}" "${targets[@]}"
}
src_test() { :; }
src_install() {
	local bin_name
	local file_name
	for file_name in *LICENSE* *.md; do
		[[ -s "${file_name}" ]] && dodoc "${file_name}"
	done
	exeinto "/usr/lib/rust/binaries/${PN}/${PVR}"
	for bin_name in "${BIN_NAMES[@]}"; do
		doexe "${WORKDIR}/bin/${bin_name}"
	done
	if use examples; then
		exeinto "/usr/lib/rust/examples/${PN}/${PVR}"
		for bin_name in "${EXAMPLE_NAMES[@]}"; do
			doexe "${WORKDIR}/bin/${bin_name}"
		done
	fi
}
crate_symlinks() {
	local bin_name
	for bin_name in "${BIN_NAMES[@]}"; do
		alternatives_auto_makesym "/usr/bin/${bin_name}" \
			"/usr/lib/rust/binaries/${PN}/*/${bin_name}"
	done
}
pkg_postinst() {
	crate_symlinks
}
pkg_postrm() {
	crate_symlinks
}
