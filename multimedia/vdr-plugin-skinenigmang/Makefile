# New ports collection makefile for:	vdr-plugin-skinenigmang
# Date created:		Wed Apr 14 18:11:42 CEST 2010
# Whom:			Juergen Lock <nox@freebsd.org>
#
# $FreeBSD$
#

PORTNAME=	vdr-plugin-skinenigmang
PORTVERSION=	0.1.1
PORTREVISION=	9
CATEGORIES=	multimedia
MASTER_SITES=	http://andreas.vdr-developer.org/enigmang/download/
DISTNAME=	${PORTNAME:S/-plugin-/-/}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}
DISTFILES=	${DISTNAME}.tgz \
		skinenigmang-logos-xpm-hi-20070702.tgz

MAINTAINER=	nox@FreeBSD.org
COMMENT=	Video Disk Recorder - Enigma-NG skin plugin

PATCH_STRIP=	-p1
HAVE_CONFIGURE=	yes
PORTDOCS=	COPYING README
MAKE_JOBS_SAFE=	yes
WRKSRC=		${WRKDIR}/${PLUGIN}-${DISTVERSION}

.include	"${.CURDIR}/../vdr/Makefile.plugins"

post-patch: post-patch-plugin

post-install: post-install-pluginlocales
	(cd ${WRKDIR}/${PLUGIN} && \
		${COPYTREE_SHARE} \* ${PREFIX}/etc/vdr/plugins/${PLUGIN} )
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR})
.endif

.include <bsd.port.mk>
