# New ports collection makefile for:	libwnck
# Date created:				12 April 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD$
#   $MCom: ports/x11-toolkits/libwnck/Makefile,v 1.133 2010/11/17 11:38:29 kwm Exp $
#

PORTNAME=	libwnck
PORTVERSION=	2.30.6
PORTREVISION?=	0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Library used for writing pagers and taskslists

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification
RUN_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection

USE_GETTEXT=	yes
USE_XORG=	xres
USE_GMAKE=	yes
USE_GNOME=	gnomehack gtk20 ltverhack referencehack intlhack
USE_BISON=	build
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>

.endif
