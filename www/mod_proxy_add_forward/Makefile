# New ports collection makefile for:	mod_proxy_add_forward
# Date created:		25 March 2001
# Whom:			Anders Nordby <anders@fix.no>
#
# $FreeBSD$
#

PORTNAME=	mod_proxy_add_forward
PORTVERSION=	20020710
CATEGORIES=	www
MASTER_SITES=	http://develooper.com/code/mpaf/
EXTRACT_SUFX=	.c

MAINTAINER=	apache@FreeBSD.org
COMMENT=	Apache module that adds a client IP header to outgoing proxy requests

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2012-01-01

MAKE_JOBS_SAFE=  yes

USE_APACHE=	13
AP_FAST_BUILD=	yes
AP_GENPLIST=	yes

NO_WRKSUBDIR=	yes

do-extract:
	@${MKDIR} ${WRKDIR}/
	@${CP} -p ${DISTDIR}/${DISTFILES} ${WRKDIR}/${PORTNAME}.c

post-install:
	@${ECHO} "================================================================================"
	@${ECHO} "Enable mod_proxy_add_forward in Apache's config manually."
	@${ECHO} "================================================================================"

.include <bsd.port.mk>
