#!/bin/sh
#
# $FreeBSD: ports/sysutils/openupsd/files/openupsd.sh,v 1.1 2004/08/17 09:25:37 pav Exp $
#
# PROVIDE: openupsd
# REQUIRE: LOGIN
# KEYWORD: FreeBSD shutdown

openupsd_enable=${openupsd_enable:-"NO"}

. %%RC_SUBR%%

name="openupsd"
rcvar=`set_rcvar`

pidfile=/var/run/${name}.pid
required_files=%%PREFIX%%/etc/${name}.conf

command=%%PREFIX%%/sbin/openupsd
command_args="-p ${pidfile}"

load_rc_config $name
run_rc_command "$1"
