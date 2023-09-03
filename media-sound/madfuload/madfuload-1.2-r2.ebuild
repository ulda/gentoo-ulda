# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
inherit autotools

DESCRIPTION="M-Audio DFU firmware loader for MobilePre, Ozone, Sonica and Transit USB audio interfaces"
HOMEPAGE="http://usb-midi-fw.sourceforge.net/"
SRC_URI="mirror://sourceforge/usb-midi-fw/${P}.tar.gz"

LICENSE="GPL-2 madfuload"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

PATCHES=(
		"${FILESDIR}/${P}"-segfault_strerror.patch
		"${FILESDIR}/${P}"-udevinfo-autotools.patch
		"${FILESDIR}/${P}"-ioctl.patch
)

src_prepare() {
		  default
		  eautoconf
		  eautomake
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README || die "adding documentation failed"
}

pkg_postinst() {
	einfo "You need to reload udev rules before connecting the device:"
	einfo "# udevadm control --reload-rules"
	einfo "Also you might have to change the MobilePre RUN parameter"
	einfo "in /etc/udev/rules.d/42-madfuload.rules to"
	einfo "\"/usr/sbin/madfuload -l -D %E{DEVICE} -3 -f /usr/share/usb/maudio/ma004103.bin\""
}
