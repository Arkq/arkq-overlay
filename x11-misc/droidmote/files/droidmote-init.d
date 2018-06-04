#!/sbin/openrc-run
# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

pidfile="/var/run/droidmote.pid"
command="/usr/bin/droidmote"
command_args="${DROIDMOTE_PORT} ${DROIDMOTE_PASSWORD}"
command_background="true"

depend() {
	after xdm
}
