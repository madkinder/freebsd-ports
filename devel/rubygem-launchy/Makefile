# Ports collection makefile for:	gem-launchy
# Date created:				06 Nov 2009
# Whom:					Ryan Steinmetz (<rpsfa@rit.edu>)
#
# $FreeBSD$

PORTNAME=	launchy
PORTVERSION=	0.4.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	A helper class for launching cross-platform applications

RUN_DEPENDS=	rubygem-configuration>=0.0.5:${PORTSDIR}/devel/rubygem-configuration

USE_RUBY=	yes
USE_RAKE=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes
PLIST_FILES+=	bin/launchy

.include <bsd.port.mk>
