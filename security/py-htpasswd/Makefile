# New ports collection makefile for:	py-htpasswd
# Date created:				2011-08-26
# Whom:					Aldis Berjoza <aldis@bsdroot.lv>
#
# $FreeBSD$
#

PORTNAME=	htpasswd
PORTVERSION=	2008.03.05
PORTREVISION=	1
CATEGORIES=	security python
MASTER_SITES=	http://files.bsdroot.lv/my/FreeBSD/distfiles/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	graudeejs@gmail.com
COMMENT=	Replacement for htpasswd

USE_PYTHON=	YES
USE_XZ=		YES

PLIST_FILES=	bin/${PORTNAME}.py

NO_BUILD=	YES
NO_WRKSUBDIR=	YES

do-patch:
	${SED} -I.orig -e 's#^/usr/bin/python#/usr/bin/env python#' ${WRKDIR}/${PORTNAME}.py
do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.py ${PREFIX}/bin/

.include <bsd.port.mk>
