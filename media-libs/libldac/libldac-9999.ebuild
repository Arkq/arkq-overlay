# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils autotools

DESCRIPTION="Audio coding technology developed by Sony"
HOMEPAGE="https://android.googlesource.com/platform/external/libldac"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://android.googlesource.com/platform/external/${PN}"
else
	HASH="15922bc3b3052b0928ba3996daf72d711f13fcf4"
	SRC_URI="https://android.googlesource.com/platform/external/${PN}/+archive/${HASH}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="debug static-libs"

DOCS=( NOTICE )

src_prepare() {
	default
	cp "${FILESDIR}"/* .
	epatch "${FILESDIR}"/${PN}-debug-to-stderr.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug)
}
