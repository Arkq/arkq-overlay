# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit autotools

DESCRIPTION="SWF compressor/decompressor"
HOMEPAGE="https://github.com/Arkq/swfpack"
SRC_URI="https://github.com/Arkq/swfpack/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-arch/xz-utils
	sys-libs/zlib"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default
}
