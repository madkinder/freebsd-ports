# New ports collection makefile for:	rubygem-rspec-expectations
# Date created:		2011-06-12
# Whom:			Steve Wills <swills@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	rspec-expectations
PORTVERSION=	2.7.0
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Rspec-expectations adds should and should_not to every object

BUILD_DEPENDS=	rubygem-diff-lcs>=1.1.2:${PORTSDIR}/textproc/rubygem-diff-lcs
RUN_DEPENDS=	rubygem-diff-lcs>=1.1.2:${PORTSDIR}/textproc/rubygem-diff-lcs

USE_RUBY=	yes
USE_RAKE=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.mk>
