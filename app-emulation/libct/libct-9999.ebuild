# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit eutils git-2

DESCRIPTION="Linux containers control plane"
HOMEPAGE="https://github.com/xemul/libct"
EGIT_REPO_URI="https://github.com/xemul/libct.git"
EGIT_BRANCH="master"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="doc"

RDEPEND="dev-libs/libnl:3"
DEPEND="${RDEPEND}
	doc? ( app-text/asciidoc app-text/xmlto )"

src_compile() {
	if use doc; then
		DOC_TARGET="docs"
	fi
	ARCH="x86_64" emake DESTDIR="${D}" DEB_HOST_MULTIARCH= all $DOC_TARGET
}

src_install() {
	ARCH="x86_64" emake DESTDIR="${D}" DEB_HOST_MULTIARCH= PREFIX="/usr" install
	if use doc; then
		dodoc Documentation/libct.txt
		doman Documentation/libct.1
	fi
	insinto "/usr/$(get_libdir)/pkgconfig"
	newins "${FILESDIR}/libct.pc" "libct.pc"
}
