# New ports collection makefile for:	py-waf
# Date created:				2009-04-29
# Whom:					Olivier Duchateau <duchateau.olivier@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	waf
PORTVERSION=	1.5.19
CATEGORIES=	devel python
MASTER_SITES=	GOOGLE_CODE
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	duchateau.olivier@gmail.com
COMMENT=	Python-based build system

LICENSE=	BSD

DEPRECATED=	Port is outdated. Author discourages system-wide installation. \
		Download it manually
EXPIRATION_DATE=	2011-12-11

USE_BZIP2=	yes
USE_PYTHON=	yes

pre-configure:
	@cd ${WRKSRC} && ${PYTHON_CMD} waf-light --make-waf && ${TRUE}

do-build:
	@cd ${WRKSRC} && ${PYTHON_CMD} waf configure --prefix=${LOCALBASE} && ${TRUE}

do-install:
	@cd ${WRKSRC} && ${PYTHON_CMD} waf install --yes && ${TRUE}

.include <bsd.port.mk>
