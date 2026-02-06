# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod toolchain-funcs
BUILD_PARAMS="CC=$(tc-getCC) V=1 KSRC=${KERNEL_DIR}"

DESCRIPTION="Newest Realtek wifi 5 codes for RTW8822BE, RTW8822CE, RTW8821CE, and RTW8723DE (All PCIe) RTW8822BU, RTW8822CU, RTW8821CU, and RTW88723DU (All USB)"
HOMEPAGE="https://github.com/lwfinger/rtw88"

EGIT_REPO_URI="https://github.com/lwfinger/rtw88"
EGIT_REPO_BRANCH="master"

inherit git-r3
KEYWORDS="~amd64"

DEPEND="virtual/linux-sources"

MODULE_NAMES="
rtw_8703b(rtw88)
rtw_8723de(rtw88)
rtw_8723d(rtw88)
rtw_8723du(rtw88)
rtw_8723x(rtw88)
rtw_8812a(rtw88)
rtw_8812au(rtw88)
rtw_8814ae(rtw88)
rtw_8814a(rtw88)
rtw_8814au(rtw88)
rtw_8821a(rtw88)
rtw_8821au(rtw88)
rtw_8821ce(rtw88)
rtw_8821c(rtw88)
rtw_8821cu(rtw88)
rtw_8822be(rtw88)
rtw_8822b(rtw88)
rtw_8822bu(rtw88)
rtw_8822ce(rtw88)
rtw_8822c(rtw88)
rtw_8822cu(rtw88)
rtw_88xxa(rtw88)
rtw_core(rtw88)
rtw_pci(rtw88)
rtw_usb(rtw88)
"

BUILD_TARGETS="all"
CONFIG_CHECK="~!RTW88"
