# New ports collection makefile for:	wmfire
# Date created:				21 October 1999
# Whom:					Chris D. Faulhaber <jedgar@fxp.org>
#
# $FreeBSD$
#

PORTNAME=	wmfire
PORTVERSION=	1.2.4
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.swanson.ukfsn.org/wmfire/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Window Maker dock app showing load average as a flame

LIB_DEPENDS=	gtop-2.0.7:${PORTSDIR}/devel/libgtop

USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_ARGS=	ACLOCAL="${TRUE}" AUTOCONF="${TRUE}" AUTOHEADER="${TRUE}" \
		AUTOMAKE="${TRUE}"

MAN1=		wmfire.1
PLIST_FILES=	bin/wmfire

.include <bsd.port.mk>
