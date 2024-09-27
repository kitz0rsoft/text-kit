# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Small command-line JSON Log viewer"
HOMEPAGE="https://github.com/brocode/fblog"
SRC_URI="https://github.com/brocode/fblog/tarball/74f4309798a6287a85ed44729d202ba5e686fc62 -> fblog-4.11.0-74f4309.tar.gz
https://regen.mordor/16/f6/06/16f6064c345aaa4b36522cbed53bda4cd5511e5c06f0d258cf55e567fda81132a0bb36431ea1c51afa5cc79b3a4f9d425e67926356164af6b5789ab2767d7cc0 -> fblog-4.11.0-funtoo-crates-bundle-a2e530d457760a81bb48f6f0820d2d1b35b59797c86bebb8b8dd9820fbeb9bfbce2022a47835ade14f2bfb5b89875b7267630175bf1286afe32e84a8f4f2f1cf.tar.gz"

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