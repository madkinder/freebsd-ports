# New ports collection makefile for:	zint
# Date created:		2010-03-13
# Whom:			Gvozdikov Veniamin <g.veniamin@googlemail.com>
#
# $FreeBSD$
#

PORTNAME=	zint
PORTVERSION=	2.4.3
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}/

MAINTAINER=	g.veniamin@googlemail.com
COMMENT=	Zint Barcode Generator

LICENSE=	GPLv3

LIB_DEPENDS=	png.6:${PORTSDIR}/graphics/png

USE_CMAKE=	yes
USE_LDCONFIG=	yes
USE_QT_VER=	4
QT_COMPONENTS=	gui xml qmake_build uic_build moc_build rcc_build designer
MAKE_JOBS_SAFE=	yes

DESKTOP_ENTRIES="Zint" "Barcode generator" "" "zint-qt" "" false

.include <bsd.port.mk>
