# New ports collection makefile for: scgi
# Date created:		19 Aug 2002
# Whom:			Neil Blakey-Milner <nbm@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	mod_scgi
PORTVERSION=	1.12
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://dryice.name/computer/FreeBSD/distfiles/
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}mod_
DISTNAME=	scgi-${PORTVERSION:S/.a/a/}

MAINTAINER=	dryice@dryice.name
COMMENT=	Apache module that implements the client side of the SCGI protocol

MAKE_JOBS_SAFE=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}/${SCGI_DIR}

USE_APACHE=	13+

AP_FAST_BUILD=	yes
AP_GENPLIST=	yes

.include <bsd.port.pre.mk>

.if ${APACHE_VERSION} >= 20
SCGI_DIR=	apache2
.else
SCGI_DIR=	apache1
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
