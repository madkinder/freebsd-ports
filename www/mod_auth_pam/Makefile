# New ports collection makefile for:	mod_auth_pam
# Date created:				2 April 2001
# Whom:					Anders Nordby <anders@fix.no>
#
# $FreeBSD$
#

PORTNAME=	mod_auth_pam
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	http://pam.sourceforge.net/mod_auth_pam/dist/

MAINTAINER=	apache@FreeBSD.org
COMMENT=	Allows users to use PAM modules for user authentication

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2012-01-01

MAKE_JOBS_SAFE=  yes

USE_APACHE=	13

AP_FAST_BUILD=	yes
AP_GENPLIST=	yes

AP_LIB=	-lpam

PORTDOCS=	configure.txt faq.txt
PORTEXAMPLES=	dot-htaccess httpd-

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/configure.txt ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/faq.txt ${DOCSDIR}/
.endif
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/samples/dot-htaccess ${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/samples/httpd- ${EXAMPLESDIR}/
.endif
	${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
