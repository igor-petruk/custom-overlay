EAPI="4"

PYTHON_COMPAT="python3_3"

EGIT_REPO_URI="git://github.com/igor-petruk/py3engine.git"
EGIT_BRANCH="master"

inherit distutils git-2

DESCRIPTION="Engine that makes writing plugins for py3status for i3 easier"
HOMEPAGE="https://github.com/igor-petruk/py3engine"
SRC_URI=""

KEYWORDS=""
LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-lang/python-3.3.5
	>=dev-python/requests-2.3.0
"

RDEPEND=""

src_prepare() {
	distutils_src_prepare
}

src_install() {
	distutils_src_install
}

pkg_postinst() {
	distutils_pkg_postinst
}
