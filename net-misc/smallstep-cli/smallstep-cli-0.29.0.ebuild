EAPI=8
inherit go-module

DESCRIPTION="A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc. "
HOMEPAGE="https://github.com/smallstep/cli/tree/master"
SRC_URI="https://github.com/smallstep/cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/ncvescera/gentoo-ncvescera/raw/refs/heads/main/net-misc/smallstep-cli/${P}-deps.tar.xz"
S="${WORKDIR}/cli-${PV}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="${RDEPEND}
	>=dev-lang/go-1.24.11
	>=dev-build/cmake-4.1.2-r1"

src_prepare() {
	default
}

src_unpack() {
	default
}

src_compile() {
	ego build -mod=vendor -v -o bin/step ./cmd/step
}

src_install() {
	dobin bin/step
}
