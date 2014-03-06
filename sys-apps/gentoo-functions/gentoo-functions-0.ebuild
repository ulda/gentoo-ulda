# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# copied from coreos-overlay because they do not root on gentoo

EAPI=5
DESCRIPTION="Stand-alone and portable version of Gentoo's functions.sh"
HOMEPAGE="https://bugs.gentoo.org/show_bug.cgi?id=373219"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="!sys-apps/openrc"

src_install() {
	local dst_dir=/lib/${PN}

	dodir $dst_dir
	insinto $dst_dir
	newins "${FILESDIR}/functions.sh" functions.sh
	fperms -R +x $dst_dir
}

pkg_postinst() {
	local dst_dir="${ROOT}"/lib/${PN}
	local functions_path="${ROOT}"/etc/init.d/functions.sh

	einfo "Creating /etc/init.d/functions.sh symlink..."
	mkdir -p "${ROOT}"/etc/init.d
	ln -sf ${dst_dir}/functions.sh ${functions_path}
}

pkg_prerm() {
	local dst_dir="${ROOT}"/lib/${PN}
	local functions_path="${ROOT}"/etc/init.d/functions.sh

	if test -L ${functions_path} && test $(readlink -f ${functions_path}) = $(readlink -f ${dst_dir}/functions.sh)
	then
		einfo "removing /etc/init.d/functions.sh symlink..."
			rm -f ${functions_path}
	else
		einfo "symlink /etc/init.d/functions.sh does not point to ${dst_dir}/functions.sh"
	fi
}
