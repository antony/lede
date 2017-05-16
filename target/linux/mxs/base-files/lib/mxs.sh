#!/bin/sh
#
# Copyright (C) 2013 OpenWrt.org
#

MXS_BOARD_NAME=
MXS_MODEL=

mxs_board_detect() {
	local machine
	local name

	machine=$(cat /proc/device-tree/model)
	name=$(strings /proc/device-tree/compatible | head -1)

	[ -z "$name" ] && name="unknown"

	[ -z "$MXS_BOARD_NAME" ] && MXS_BOARD_NAME="$name"
	[ -z "$MXS_MODEL" ] && MXS_MODEL="$machine"

	[ -e "/tmp/sysinfo/" ] || mkdir -p "/tmp/sysinfo/"

	echo "$MXS_BOARD_NAME" > /tmp/sysinfo/board_name
	echo "$MXS_MODEL" > /tmp/sysinfo/model
}
