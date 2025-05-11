# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="rga is a line-oriented search tool that allows you to look for a regex in a multitude of file types"
HOMEPAGE="https://github.com/phiresky/ripgrep-all"
SRC_URI="https://github.com/phiresky/ripgrep-all/tarball/2ccf3eeb71e491f074fce67e3c2d1f72f380b09a -> ripgrep-all-0.10.9-2ccf3ee.tar.gz
https://regen.mordor/33/c4/20/33c4202cb45eb405f34ae56707144d1ce3728f6a87c9f77fedb85e18ee60b838f6fafb02d5c672ade1f970445431d3cceedd8de492186466da7a3baaf64bc4da -> ripgrep_all-0.10.9-funtoo-crates-bundle-2f6a9516b96d845c64075b3436fcad7f681b947236c94b244bc6fbbd9202e73718b802117c4d5d0cd7380910c17bf88bff96d39e458fc65ce45e18a65e8d6ff6.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	virtual/rust
	|| (
		app-text/pandoc-bin
		app-text/pandoc
	)
	app-text/poppler
	media-video/ffmpeg
	sys-apps/ripgrep
"

src_unpack() {
	cargo_src_unpack

	rm -rf ${S}
	mv ${WORKDIR}/phiresky-ripgrep-all-* ${S} || die
}