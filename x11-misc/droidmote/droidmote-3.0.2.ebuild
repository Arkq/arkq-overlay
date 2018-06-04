# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="Remote Control with Multi Touch features"
HOMEPAGE="https://www.videomap.it/"

SRC_URI="
	amd64? ( https://docs.google.com/uc?export=download&id=0B-EA_LjgyxcHV2lZTGtxS191VkU -> ${P}.x86_64.tar )
	x86? ( https://docs.google.com/uc?export=download&id=0B-EA_LjgyxcHSFpVb2JSLTIyOEk -> ${P}.i386.tar )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	x11-libs/libX11
"

S="${WORKDIR}"

src_install() {

	exeinto /usr/bin
	doexe droidmote

	newconfd "${FILESDIR}"/droidmote-conf.d droidmote
	newinitd "${FILESDIR}"/droidmote-init.d droidmote
}
