#!/bin/sh
#
# $FreeBSD: ports/security/clamav-devel/files/clamav-milter.sh,v 1.5 2004/11/04 22:49:52 pav Exp $
#

# PROVIDE: clamav-milter
# REQUIRE: LOGIN
# BEFORE: mail
# KEYWORD: FreeBSD shutdown

#
# Add the following lines to /etc/rc.conf to enable clamav-milter:
#
#clamav_milter_enable="YES"
#
# See clamav-milter(1) for flags
#

. %%RC_SUBR%%

name=clamav_milter
rcvar=`set_rcvar`

command=%%PREFIX%%/sbin/clamav-milter
required_dirs=%%DBDIR%%
required_files=%%PREFIX%%/etc/clamd.conf

start_precmd=start_precmd

start_precmd()
{
	if [ -S "$clamav_milter_socket" ]; then
		warn "Stale socket $clamav_milter_socket removed."
		rm "$clamav_milter_socket"
	fi
	rc_flags="${flags:-$clamav_milter_flags} $clamav_milter_socket"
}

# read settings, set default values
load_rc_config $name
: ${clamav_milter_enable="NO"}
: ${clamav_milter_socket="%%CLAMAV_MILTER_SOCKET%%"}
: ${clamav_milter_flags="--postmaster-only --local --outgoing --max-children=50"}

# add socket to any given argument
clamav_milter_flags="${clamav_milter_flags} ${clamav_milter_socket}"
run_rc_command "$1"
