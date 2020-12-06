# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson systemd pam

DESCRIPTION="D-Bus service to access fingerprint readers"
HOMEPAGE="https://gitlab.freedesktop.org/libfprint/fprintd"

# adapt to upstream versioning name since v1.90.4
SRC_URI="https://gitlab.freedesktop.org/libfprint/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"
S="${WORKDIR}/${PN}-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="doc pam systemd"

DEPEND="
	!systemd? ( sys-auth/elogind )
	systemd? ( sys-apps/systemd )
	sys-apps/dbus
	dev-libs/dbus-glib
	dev-libs/glib:2
	>=sys-auth/libfprint-1.90.0
	sys-auth/polkit
	pam? ( sys-libs/pam )
"

# pam_fprintd needs libsystemd for dbus handling.

RDEPEND="${RDEPEND}
	dev-python/dbus-python
	dev-python/dbusmock
	dev-python/pycairo
	pam? ( sys-libs/pam_wrapper )
	doc? (
		dev-util/gtk-doc
		dev-util/gtk-doc-am
		dev-libs/libxml2
		dev-libs/libxslt
	)
"

BDEPEND="virtual/pkgconfig"

PATCHES=(
	${FILESDIR}/${PV}-disable_tests.patch
	${FILESDIR}/${PV}-fix-permissions.patch
		)

#S="${WORKDIR}/${PN}-${PV}"

src_prepare(){
	default
	use systemd || eapply "${FILESDIR}/${PV}-elogind.patch"

}

src_configure() {
		local systemddir=$(systemd_get_systemunitdir)
		local emesonargs=(
			$(meson_use pam)
			$(meson_use doc gtk_doc)
			-Dpam_modules_dir="$(getpam_mod_dir)"
			-Dsystemd_system_unit_dir=$(usex systemd "$(systemd_get_systemunitdir)" "")
		)
		meson_src_configure
}
