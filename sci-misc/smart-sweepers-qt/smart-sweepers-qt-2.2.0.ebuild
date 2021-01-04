# Copyright 2010-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit gnome2-utils qmake-utils

DESCRIPTION="Educational simulation framework for a simple AI model"
HOMEPAGE="https://github.com/Arkq/smart-sweepers-qt"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Arkq/${PN}"
else
	SRC_URI="https://github.com/Arkq/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="openmp"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5 PREFIX="${D}/usr" DEFINES+=$(usex openmp WITH_OPENMP "")
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
