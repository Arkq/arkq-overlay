# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools

DESCRIPTION="Reverse-engineered apt-X library"
HOMEPAGE="https://github.com/Arkq/openaptx"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Arkq/${PN}"
else
	SRC_URI="https://github.com/Arkq/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="bindist +ffmpeg +sndfile"

RDEPEND="sndfile? ( media-libs/libsndfile )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable !bindist aptx422) \
		$(use_with ffmpeg) \
		$(use_with sndfile)
}

src_install() {
	default
}
