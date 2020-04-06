# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson udev systemd

DESCRIPTION="D-Bus service to access fingerprint readers"
HOMEPAGE="https://cgit.freedesktop.org/libfprint/fprintd/"
#SRC_URI="https://gitlab.freedesktop.org/libfprint/fprintd/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://gitlab.freedesktop.org/libfprint/fprintd/uploads/a47c31c844e23e070665a8a85dae0144/fprintd-1.90.1.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="doc pam systemd"

RDEPEND="
	dev-libs/dbus-glib
	dev-libs/glib:2
	>=sys-auth/libfprint-1.90
	sys-auth/polkit
	pam? ( sys-libs/pam )
"

DEPEND="${RDEPEND}
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	dev-util/intltool
	doc? ( dev-libs/libxml2 dev-libs/libxslt )
	systemd? ( sys-apps/systemd )
"

BDEPEND="virtual/pkgconfig"

PATCHES=( ${FILESDIR}/disable_tests.patch )

#S="${WORKDIR}/${PN}-${PV}"

src_configure() {
		local systemddir=$(systemd_get_systemunitdir)
		local emesonargs=(
			$(meson_use pam)\
			$(meson_use doc gtk_doc) \
			$(use systemd && echo '-Dsystemd_system_unit_dir="'$systemddir'"' ) \
		)
		meson_src_configure
}
