# New ports collection makefile for:	pkg_cleanup
# Date created:				02 November 2007
# Whom:					Stephen Hurd <shurd@sasktel.net>
#
# $FreeBSD$
#

PORTNAME=	pkg_cleanup
PORTVERSION=	1.1
CATEGORIES=	ports-mgmt
DISTFILES=

MAINTAINER=	shurd@sasktel.net
COMMENT=	Interactive program for deinstalling 'leaf' packages

MAN1=		pkg_cleanup.1

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	sbin/pkg_cleanup

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 900000 && ${OSVERSION} < 900038
IGNORE=		requires r223289 or higher to compile
.endif

do-extract:
	${MKDIR} ${WRKSRC}
	${CP} -R ${FILESDIR}/* ${WRKSRC}

do-build:
	make -C ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pkg_cleanup ${PREFIX}/sbin/pkg_cleanup
	${INSTALL_MAN} ${WRKSRC}/pkg_cleanup.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>
