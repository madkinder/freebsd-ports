# New ports collection makefile for:	mod_ntlm
# Date created:	   04 July 2004
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD$
#

PORTNAME=	mod_ntlm
PORTVERSION=	0.4
CATEGORIES=	www
MASTER_SITES=	SF/modntlm/modntlm/${PORTVERSION}
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}

MAINTAINER=	skv@FreeBSD.org
COMMENT=	NTLM authentication module for the Apache webserver

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2012-01-01

MAKE_JOBS_SAFE=  yes

USE_APACHE=	13
MAKE_ENV=	APXS=${APXS}

.include <bsd.port.pre.mk>

post-patch:
	${FIND} ${WRKSRC}/smbval -name "*.inc.c" -type f|${XARGS} \
		${REINPLACE_CMD} -e "s/malloc.h/stdlib.h/g"
	${REINPLACE_CMD} -e "s/APXS=.*//" ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e "s!#include <sys/vfs.*!!" \
		${WRKSRC}/smbval/smbencrypt.inc.c
.if ${OSVERSION} >= 700042
	${REINPLACE_CMD} -e "s/extern/static/" ${WRKSRC}/smbval/smblib-priv.h
.endif

post-install:
.ifndef(NOPORTDOCS)
	@${ECHO_MSG} "===>   Installing documentation for ${PKGNAME}"
	@${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/Documentation/mod_ntlm.html ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
