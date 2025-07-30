# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/f6dd0a4a13dfbf02a31ad8494e671fcddf832e48 -> mdBook-0.4.52-f6dd0a4.tar.gz
https://regen.mordor/0d/3c/28/0d3c28dad2f237a0e4cfdcfe19d19c110f37c96fcc0823b76f9ed46f000a8531781127bbf3e04d7ec4ccf600bee5dd95322f903a7f4fd2c4a320869bacc04348 -> mdbook-0.4.52-funtoo-crates-bundle-daede805ce478cef79044dc9fa271181a9fbe1dc8409dc0d42ca2e9570a84907326daad90ac14dec99aaf09cbfab965f59feb331776608b44573d2f6b69a9602.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-f6dd0a4"

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