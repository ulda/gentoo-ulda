# Copyright 2019 ulf.dambacher@web.de
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND=2

inherit git-2  python

EGIT_REPO_URI="git://git.gnome.org/jhbuild"

DESCRIPTION="bleeding edge gnome build system"
HOMEPAGE="http://developer.gnome.org/jhbuild/unstable/geting-started.html"

SRC_URI=""
SLOT=0

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/python-2.3 \
	 >=dev-vcs/cvs-1.12 \
	 >=dev-vcs/subversion-1.7 "

DEPEND="${RDEPEND}"

EGIT_BOOTSTRAP="autogen.sh"
