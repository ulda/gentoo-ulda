# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils git-r3

DESCRIPTION="Jamulus online team music practicing software "
HOMEPAGE="https://jamulus.io/"
EGIT_REPO_URI="https://github.com/jamulussoftware/jamulus.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

#BDEPEND="dev-qt/linguist-tools:5"
DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	dev-qt/qtxml:5
	dev-qt/qtconcurrent:5
	virtual/jack
"
#RDEPEND="${DEPEND}
#	dev-qt/qtsvg:5
#"

src_configure() {
	eqmake5 Jamulus.pro PREFIX="/usr" -o Makefile
}

src_install() {
	emake INSTALL_ROOT="${D}"  install
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
