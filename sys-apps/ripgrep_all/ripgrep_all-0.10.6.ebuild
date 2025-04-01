# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="rga is a line-oriented search tool that allows you to look for a regex in a multitude of file types"
HOMEPAGE="https://github.com/phiresky/ripgrep-all"
SRC_URI="https://github.com/phiresky/ripgrep-all/tarball/424e293942009283c735579f65dd90c2f314094f -> ripgrep-all-0.10.6-424e293.tar.gz
https://regen.mordor/4c/76/d4/4c76d4db68ae9df0e03c0444bca8f1b3c14d24d5c5715b6720852526480e42f224031652ed33066e432dcb90489319a27bcb09ad0e3954b15bc8f496710561a9 -> ripgrep_all-0.10.6-funtoo-crates-bundle-83b9919e60c19ea2a214cd60dd8e56f8102f94b62bcf0adc00f384dce020c1891f5d0edaf104b02d1a1c8155acb1232aa409a9f4952661f95559eab5f865715c.tar.gz"

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