# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake

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
IUSE="bindist doc +ffmpeg +sndfile"

RDEPEND="
	ffmpeg? ( media-video/ffmpeg )
	sndfile? ( media-libs/libsndfile )"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )
	virtual/pkgconfig"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_DOC="$(usex doc)"
		-DWITH_FFMPEG="$(usex ffmpeg)"
		-DWITH_SNDFILE="$(usex sndfile)"
	)
	cmake_src_configure
}
