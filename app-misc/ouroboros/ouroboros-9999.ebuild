# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Ongoing Build Assistant"
HOMEPAGE="https://github.com/Arkq/ouroboros"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Arkq/${PN}"
else
	SRC_URI="https://github.com/Arkq/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="dev-libs/iniparser
	dev-libs/libconfig
	sys-process/procps"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--enable-libconfig \
		--enable-iniparser \
		--enable-server
}
