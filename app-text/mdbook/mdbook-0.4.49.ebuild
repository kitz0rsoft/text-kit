# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/785ee564c562487898aa6bab50cb24b08c87d97d -> mdBook-0.4.49-785ee56.tar.gz
https://distfiles.macaronios.org/e0/0f/e3/e00fe3cfbb807bb6616f3aaf8f8fccca21e2c0fbdfe5ec4c6a9dc265d85152154b63ab6719c6f0ee0dbad5399af5f2c4d406f41408a68cc7f8b42ad42af98786 -> mdbook-0.4.49-funtoo-crates-bundle-340bcae536ae022de41ca50bb010a86a96ac09007eae83ef12de974929dcb2e76158749f264ec9bf5d74957cdcc1d0cb8ff01e41ceb225581a72678f29f37d69.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-785ee56"

# CC-BY-4.0/OFL-1.1: embeds fonts inside the executable
LICENSE="MPL-2.0 CC-BY-4.0 OFL-1.1"
LICENSE+="
	Apache-2.0 BSD ISC MIT Unicode-DFS-2016
	|| ( Artistic-2 CC0-1.0 )
" # crates
SLOT="0"
KEYWORDS="*"
IUSE="doc"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_compile() {
	cargo_src_compile

	if use doc; then
		if tc-is-cross-compiler; then
			ewarn "html docs were skipped due to cross-compilation"
		else
			target/$(usex debug{,} release)/${PN} build -d html guide || die
		fi
	fi
}

src_install() {
	cargo_src_install

	dodoc CHANGELOG.md README.md
	use doc && ! tc-is-cross-compiler && dodoc -r guide/html
}