# New ports collection makefile for:    netrek
# Date created:         15 Mar 1999
# Whom:                 Donald Burr <dburr@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	netrek-COW
PORTVERSION=	3.00.0
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://ftp.netrek.org/pub/netrek/clients/cow/COW-bin/old/
DISTFILES=	COW.3.00pl0.FreeBSD.gz

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A 16-player network space battle/conquest game with a Star Trek theme

NO_BUILD=		YES
NO_WRKSUBDIR=		YES
PLIST_FILES=	bin/netrek

do-extract:
	${MKDIR} ${WRKDIR}
	${GUNZIP_CMD} < ${DISTDIR}/${DISTFILES} > ${WRKDIR}/netrek

do-install:
	${INSTALL} -c -o root -g wheel -m 555 ${WRKDIR}/netrek ${PREFIX}/bin
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
