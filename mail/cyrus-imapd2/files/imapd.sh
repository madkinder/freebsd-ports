#!/bin/sh

# Start or stop cyrus-imapd
# $FreeBSD: ports/mail/cyrus-imapd2/files/imapd.sh,v 1.7 2003/08/31 07:05:45 ume Exp $

# PROVIDE: cyrus_imapd
# REQUIRE: DAEMON
# BEFORE: mail
# KEYWORD: FreeBSD shutdown
#
# NOTE for FreeBSD 5.0+:
# If you want this script to start with the base rc scripts
# move imapd.sh to /etc/rc.d/cyrus_imapd

prefix=%%PREFIX%%

# Define these cyrus_imapd_* variables in one of these files:
#	/etc/rc.conf
#	/etc/rc.conf.local
#	/etc/rc.conf.d/cyrus_imapd
#
# DO NOT CHANGE THESE DEFAULT VALUES HERE
#
cyrus_imapd_enable="NO"				# Enable imapd
#cyrus_imapd_program="${prefix}/cyrus/bin/master"	# Location of imapd
cyrus_imapd_flags="-d"				# Flags to imapd program

. %%RC_SUBR%%

name="cyrus_imapd"
rcvar=`set_rcvar`
command="${prefix}/cyrus/bin/master"
pidfile="/var/run/cyrus-master.pid"
required_files="${prefix}/etc/cyrus.conf ${prefix}/etc/imapd.conf"

load_rc_config $name
run_rc_command "$1"
