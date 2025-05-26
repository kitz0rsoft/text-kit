# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/f93b2675ffde5bf22a108a9d65725b65d5b153d4 -> mdBook-0.4.51-f93b267.tar.gz
https://regen.mordor/32/f6/5c/32f65c8bba14178ea3d172b178c336decd3ca37bc4e3956087abfe7e4bfd7287d2b869cc213193b5498cfc989d2da3b41647e486b588c23b6340b3c5df4bbb62 -> mdbook-0.4.51-funtoo-crates-bundle-ccaa5c05bfa33215ddf9051b8ce5586d5ac9935422e30a39a5abfc8862d6f7afdc86d3979a45fd92d25537187ccbd920698e6c8ea89589f4acd1ac801d9b765a.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-f93b267"

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