# New ports collection makefile for:	arpscan
# Date created:				22 Mar 2004
# Whom:					David Yeske <dyeske@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	arpscan
PORTVERSION=	0.3
CATEGORIES=	net-mgmt
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Simple arp scanner

LIB_DEPENDS=	dnet.1:${PORTSDIR}/net/libdnet

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=--with-libdnet=${LOCALBASE}

PLIST_FILES=	bin/arpscan

.include <bsd.port.mk>
