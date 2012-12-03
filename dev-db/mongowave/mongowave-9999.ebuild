EAPI="4"

PYTHON_COMPAT="python3_2"

EGIT_REPO_URI="git://github.com/igor-petruk/mongo-wave.git"
EGIT_BRANCH="master"

inherit distutils git-2

DESCRIPTION="MongoDB Gtk+ database viewer"
HOMEPAGE="https://github.com/igor-petruk/mongo-wave"
SRC_URI=""

KEYWORDS=""
LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-3.4.4[introspection]
	>=dev-lang/python-3.2.3
	>=dev-python/pymongo-2.4
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
