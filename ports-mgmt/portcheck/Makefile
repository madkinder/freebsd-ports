# New ports collection makefile for:   portcheck
# Date created:        01 January 2007
# Whom:                Kim Naim Lesmer <kim@bitflop.com>
#
# $FreeBSD$
#

PORTNAME=	portcheck
PORTVERSION=	1.13
CATEGORIES=	ports-mgmt
MASTER_SITES=	http://www.bitflop.com/pub/sh/portcheck/
EXTRACT_SUFX=	.tbz
DIST_SUBDIR=	rerolled

MAINTAINER=	kim@bitflop.com
COMMENT=	Maintains the ports tree and checks up the installed packages

RUN_DEPENDS=	${LOCALBASE}/sbin/portaudit:${PORTSDIR}/ports-mgmt/portaudit

PLIST_FILES=	bin/portcheck
MAN1=		portcheck.1
NO_WRKSUBDIR=	yes
NO_BUILD=	yes

do-install:
	@${INSTALL_SCRIPT} ${WRKDIR}/portcheck ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKDIR}/portcheck.1 ${MAN8PREFIX}/man/man1
	@${ECHO} ""
	@${ECHO} "See 'man portcheck' for information about usage."
	@${ECHO} ""

.include <bsd.port.mk>
