# in order to update vendor/ folder see https://wiki.gentoo.org/wiki/Writing_go_Ebuilds

EAPI=8
inherit git-r3 go-module

DESCRIPTION="A zero trust swiss army knife for working with X509, OAuth, JWT, OATH OTP, etc. "
HOMEPAGE="https://github.com/smallstep/cli/tree/master"
SRC_URI="https://github.com/smallstep/cli.git"
EGIT_REPO_URI="https://github.com/smallstep/cli.git"
EGIT_COMMIT="v${PV}"  # Tag name
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="${RDEPEND}
	>=dev-lang/go-1.24.11
	>=dev-build/cmake-4.1.2-r1"

src_unpack() {
	git-r3_src_unpack
    go-module_live_vendor # This is needed most of the time except when the source includes the vendor files too, like the lazygit project
}

src_compile() {
	emake build
}

src_install() {
	dobin bin/step
}
