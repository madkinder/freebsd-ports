# New ports collection makefile for:	tn-hunspell
# Date created:		2011-07-20
# Whom:			Baptiste Daroussin <bapt@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	hunspell
PORTVERSION=	20110323
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_MOZILLA_EXTENDED}
MASTER_SITE_SUBDIR=	addons/46617
PKGNAMEPREFIX=	tn-
DISTNAME=	tswana_spell_checker-${PORTVERSION}-tb+sm+fx+fn
EXTRACT_SUFX=	.xpi
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	office@FreeBSD.org
COMMENT=	Tswana hunspell dictionaries

USE_ZIP=	yes
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/dictionaries

PLIST_FILES=	%%DATADIR%%/tn_BW.aff \
		%%DATADIR%%/tn_BW.dic \
		%%DATADIR%%/tn_ZA.aff \
		%%DATADIR%%/tn_ZA.dic
PLIST_DIRSTRY=	%%DATADIR%%

do-install:
	${MKDIR} ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/tn-ZA.aff ${DATADIR}/tn_ZA.aff
	${INSTALL_DATA} ${WRKSRC}/tn-ZA.dic ${DATADIR}/tn_ZA.dic
	${LN} -s tn_ZA.aff ${DATADIR}/tn_BW.aff
	${LN} -s tn_ZA.dic ${DATADIR}/tn_BW.dic

.include <bsd.port.mk>
