# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit autotools

DESCRIPTION="Simple screen lock application for X server"
HOMEPAGE="https://github.com/Arkq/alock"
SRC_URI="https://github.com/Arkq/alock/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dunst gcrypt +imlib +pam shadow xbacklight xpm"

COMMON_DEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrender
	x11-libs/libXcursor
	gcrypt? ( dev-libs/libgcrypt )
	imlib? ( media-libs/imlib2[X] )
	pam? ( virtual/pam )
	shadow? ( virtual/shadow )
	xpm? ( x11-libs/libXpm )"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig"
RDEPEND="${COMMON_DEPEND}
	dunst? ( x11-misc/dunst )
	xbacklight? ( x11-apps/xbacklight )"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable gcrypt hash) \
		$(use_enable imlib imlib2) \
		$(use_enable pam) \
		$(use_enable shadow passwd) \
		$(use_enable xpm) \
		$(use_with dunst) \
		$(use_with xbacklight)
}

src_install() {
	default
}
