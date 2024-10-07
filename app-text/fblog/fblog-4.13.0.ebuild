# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Small command-line JSON Log viewer"
HOMEPAGE="https://github.com/brocode/fblog"
SRC_URI="https://github.com/brocode/fblog/tarball/db4d6e4c85b7a721dadf467b6cbc0144918b0eb8 -> fblog-4.13.0-db4d6e4.tar.gz
https://regen.mordor/00/aa/4c/00aa4cd21eea00f67b252a0fe76ffdb0970d0ab05dd8e7ced8a77c72d6d029613b19ca980c16c726b6766d8f02572a31071fa92623f74b77c6079e3a3d99b2ea -> fblog-4.13.0-funtoo-crates-bundle-af581006f28a2e07637b6c1803f9e9dcf78a384e3cddd1e330a2eb9296170aaacaf312f9a86bee8c3fe67816ed4eb2609fa0d622beb24be89201646b320fec2f.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense WTFPL-2 ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="virtual/rust"

DOCS=(
	README.md
	sample.json.log
	sample_context.log
	sample_nested.json.log
	sample_numbered.json.log
)

QA_FLAGS_IGNORED="/usr/bin/fblog"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/brocode-fblog-* ${S} || die
}