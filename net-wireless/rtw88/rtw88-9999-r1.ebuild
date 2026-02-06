# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

DESCRIPTION="Newest Realtek wifi 5 codes for RTW8822BE, RTW8822CE, RTW8821CE, and RTW8723DE (All PCIe) RTW8822BU, RTW8822CU, RTW8821CU, and RTW88723DU (All USB)"
HOMEPAGE="https://github.com/lwfinger/rtw88"

EGIT_REPO_URI="https://github.com/lwfinger/rtw88"
EGIT_REPO_BRANCH="master"

SLOT=0
KEYWORDS="~amd64"

inherit git-r3

src_compile() {
	local modlist=(
		rtw_8703b=net/wireless/realtek/rtw88
		rtw_8723cs=net/wireless/realtek/rtw88
		rtw_8723de=net/wireless/realtek/rtw88
		rtw_8723d=net/wireless/realtek/rtw88
		rtw_8723ds=net/wireless/realtek/rtw88
		rtw_8723du=net/wireless/realtek/rtw88
		rtw_8723x=net/wireless/realtek/rtw88
		rtw_8812au=net/wireless/realtek/rtw88
		rtw_8814a=net/wireless/realtek/rtw88
		rtw_8814au=net/wireless/realtek/rtw88
		rtw_8821a=net/wireless/realtek/rtw88
		rtw_8821au=net/wireless/realtek/rtw88
		rtw_8821ce=net/wireless/realtek/rtw88
		rtw_8821c=net/wireless/realtek/rtw88
		rtw_8821cs=net/wireless/realtek/rtw88
		rtw_8821cu=net/wireless/realtek/rtw88
		rtw_8822be=net/wireless/realtek/rtw88
		rtw_8822b=net/wireless/realtek/rtw88
		rtw_8822bs=net/wireless/realtek/rtw88
		rtw_8822bu=net/wireless/realtek/rtw88
		rtw_8822ce=net/wireless/realtek/rtw88
		rtw_8822c=net/wireless/realtek/rtw88
		rtw_8822cs=net/wireless/realtek/rtw88
		rtw_8822cu=net/wireless/realtek/rtw88
		rtw_core=net/wireless/realtek/rtw88
		rtw_pci=net/wireless/realtek/rtw88
		rtw_sdio=net/wireless/realtek/rtw88
		rtw_usb=net/wireless/realtek/rtw88
	)
	local modargs=( KSRC="${KV_OUT_DIR}" )

	linux-mod-r1_src_compile
}
