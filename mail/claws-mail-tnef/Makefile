# New ports collection makefile for:	claws-mail-tnef
# Date created:		26 November 2007
# Whom:			Martin Wilke <miwi@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	tnef
PORTVERSION=	0.3.11
CATEGORIES=	mail
MASTER_SITES=	http://www.claws-mail.org/downloads/plugins/
PKGNAMEPREFIX=	claws-mail-
DISTNAME=	tnef_parse-${PORTVERSION}

MAINTAINER=	miwi@FreeBSD.org
COMMENT=	TNEF parser plugin for claws-mail

LICENSE=	GPLv3

BUILD_DEPENDS=	claws-mail>=3.7.10:${PORTSDIR}/mail/claws-mail
RUN_DEPENDS=	claws-mail>=3.7.10:${PORTSDIR}/mail/claws-mail

USE_GMAKE=	yes
USE_XORG=	x11
USE_AUTOTOOLS=	autoconf
MAKE_JOBS_SAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

.include <bsd.port.mk>
