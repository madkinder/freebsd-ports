# New ports collection makefile for:	screenie
# Date created:				10 August 2004
# Whom:					Emanuel Haupt <ehaupt@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	screenie
PORTVERSION=	1.30.0
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	CRITICAL

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	A small and lightweight screen(1) wrapper

RUN_DEPENDS=	screen:${PORTSDIR}/sysutils/screen

NO_BUILD=	yes

LICENSE=	GPLv2

MAN1=		screenie.1
PLIST_FILES=	sbin/screenie

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MANPREFIX}/man/man1

.include <bsd.port.mk>
