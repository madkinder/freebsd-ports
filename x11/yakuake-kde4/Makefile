# New ports collection makefile for:   yakuake
# Date created:                        7th September, 2008
# Whom:                                Shane Bell <decept0@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	yakuake
PORTVERSION=	2.9.8
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/${PORTVERSION}/src
PKGNAMESUFFIX=	-kde4

MAINTAINER=	decept0@gmail.com
COMMENT=	Drop-down terminal emulator for KDE

LICENSE=	GPLv2

USE_BZIP2=	yes
USE_CMAKE=	yes
USE_KDE4=	kdelibs kdeprefix automoc4
USE_GETTEXT=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib qmake_build moc_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes

.include <bsd.port.mk>
