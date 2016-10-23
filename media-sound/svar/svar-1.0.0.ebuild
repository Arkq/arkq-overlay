# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit autotools

DESCRIPTION="Simple Voice Activated Recorder"
HOMEPAGE="https://github.com/Arkq/svar"
SRC_URI="https://github.com/Arkq/svar/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sndfile vorbis"

RDEPEND="media-libs/alsa-lib
	sndfile? ( media-libs/libsndfile )
	vorbis? ( media-libs/libvorbis )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable sndfile sndfile) \
		$(use_enable vorbis vorbis)
}

src_install() {
	default
}
