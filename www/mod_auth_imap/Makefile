# New ports collection makefile for:	mod_auth_imap
# Date created:				Jun 5 2004
# Whom:					Clement Laforet <clement@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	mod_auth_imap
PORTVERSION=	1.1
CATEGORIES=	www
MASTER_SITES=	http://ben.brillat.net/files/projects/mod_auth_imap/
DIST_SUBDIR=	apache

MAINTAINER=	apache@FreeBSD.org
COMMENT=	An Apache module to provide authentication via an IMAP mail server

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2012-01-01

MAKE_JOBS_SAFE=  yes

USE_APACHE=	13
AP_FAST_BUILD=	YES
AP_GENPLIST=	YES

PORTDOCS=	htaccess-example httpd.conf-append-example

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/examples && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
