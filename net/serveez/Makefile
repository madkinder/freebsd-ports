# ex:ts=8
# Ports collection makefile for:	serveez
# Date created:			May 16, 2002
# Whom:				ijliao
#
# $FreeBSD$
#

PORTNAME=	serveez
PORTVERSION=	0.1.5
PORTREVISION=	7
CATEGORIES=	net devel
MASTER_SITES=	GNU

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A server framework

LIB_DEPENDS=	guile.21:${PORTSDIR}/lang/guile

GUILE_CONFIG?=	${LOCALBASE}/bin/guile-config

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

MAN1=	serveez.1 serveez-config.1
INFO=	serveez serveez-api

CPPFLAGS+=	`${GUILE_CONFIG} compile`
LDFLAGS+=	`${GUILE_CONFIG} link`

post-patch:
	@${REINPLACE_CMD} -e 's|-release||g' \
		${WRKSRC}/src/libserveez/Makefile.in

.include <bsd.port.mk>
