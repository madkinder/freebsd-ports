# New ports collection Makefile for:	aird
# Date created:				23 April 2011
# Whom:					crees
#
# $FreeBSD$
#

PORTNAME=	aird
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	http://www.bayofrum.net/dist/${PORTNAME}/

MAINTAINER=	crees@FreeBSD.org
COMMENT=	Handles Apple IR receiver button events

USE_RC_SUBR=	${PORTNAME}
MAN1=		${PORTNAME}.1
MANCOMPRESSED=	yes

ONLY_FOR_ARCHS=	i386 amd64

PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${MAN1}.gz ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
