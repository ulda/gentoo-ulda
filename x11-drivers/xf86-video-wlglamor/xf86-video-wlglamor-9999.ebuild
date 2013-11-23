# Copyright 2013 ulf.dambacher@web.de
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit linux-info xorg-2

EGIT_REPO_URI="https://github.com/axeldavy/${PN}"

DESCRIPTION="Xwayland glamor DDX"
HOMEPAGE="http://github.com/axeldavy/xf86-video-wlglamor/"
SRC_URI=""

KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/glamor-0.5[-gles] \
	 >=dev-libs/weston-1.3.1[xwayland] \
	 >=x11-base/xorg-server-1.14"

DEPEND="${RDEPEND}"
