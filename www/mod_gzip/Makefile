# New ports collection makefile for:	mod_gzip Apache module
# Date created:		Dec 13 2000
# Whom:			Mikhail Teterin <mi@aldan.algebra.com>
#
# $FreeBSD$
#

PORTNAME=	mod_gzip
PORTVERSION=	1.3.26.1a
CATEGORIES=	www
MASTER_SITES=	SF/mod-gzip/mod-gzip13x/${PORTNAME}-${PORTVERSION}
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ale@FreeBSD.org
COMMENT=	An Internet Content Acceleration module for Apache

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2012-01-01

MAKE_JOBS_SAFE=	yes

USE_APACHE=	13

AP_FAST_BUILD=	yes
AP_GENPLIST=	yes

PORTDOCS=	*.htm *.png *.gif
PORTEXAMPLES=	${PORTNAME}.conf.sample

post-patch:
	@${REINPLACE_CMD} 's|-Wc,-Wall,-O3,-fomit-frame-pointer,-pipe||' ${WRKSRC}/Makefile

post-install:
.if !defined(NOPORTEXAMPLES)
	@${MKDIR} ${EXAMPLESDIR}/
	@${INSTALL_DATA} ${WRKSRC}/docs/${PORTNAME}.conf.sample ${EXAMPLESDIR}/
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/
	@${INSTALL_DATA} ${WRKSRC}/docs/manual/english/* ${DOCSDIR}/
.endif

.include <bsd.port.mk>
