# New ports collection makefile for:	kmilo
# Date created:				January 22 2006
# Whom:					Michael Nottebrock <lofi@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	kmilo
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	3
CATEGORIES=	sysutils kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
PKGNAMEPREFIX=	kdeutils-
DISTNAME=	kdeutils-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Enables special keys on custom keyboards

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

ONLY_FOR_ARCHS=	i386 amd64
USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/kdeutils-${PORTVERSION}

USE_LDCONFIG=	yes

pre-configure:
	${ECHO_CMD} ${PORTNAME} > ${WRKSRC}/inst-apps

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.mk>
