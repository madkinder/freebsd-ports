# New ports collection makefile for:	xmx 1.1
# Date created:		February 23, 1999
# Whom:			Oliver Breuninger <ob@seicom.NET>
#
# $FreeBSD$
#

PORTNAME=	xmx
PORTVERSION=	1.1
PORTREVISION=	3
CATEGORIES=	x11
MASTER_SITES=	ftp://ftp.cs.brown.edu/pub/xmx/
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@FreeBSD.org
COMMENT=	An X protocol multiplexor

USE_XORG=	x11

MAN1=		xmx.1
PLIST_FILES=	bin/xmx

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/xmx

.include <bsd.port.mk>
