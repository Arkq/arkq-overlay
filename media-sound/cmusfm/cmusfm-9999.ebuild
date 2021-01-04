# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Last.fm scrobbler for cmus music player"
HOMEPAGE="https://github.com/Arkq/cmusfm"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Arkq/${PN}"
else
	SRC_URI="https://github.com/Arkq/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="libnotify"

CDEPEND="net-misc/curl
	dev-libs/openssl:0=
	libnotify? ( >=x11-libs/libnotify-0.7 )"
DEPEND="${CDEPEND}
	virtual/pkgconfig"
RDEPEND="${CDEPEND}
	media-sound/cmus"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable libnotify)
}
