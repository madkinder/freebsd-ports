# New ports collection makefile for:	rubygem-sdl
# Date created:		2011-04-10
# Whom:			Steve Wills <swills@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	sdl
PORTVERSION=	2.1.1
CATEGORIES=	devel graphics audio ruby
MASTER_SITES=	RG
DISTNAME=	rubysdl-${PORTVERSION}

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Ruby extension library to use SDL library

RUN_DEPENDS=	rubygem-opengl>=0.60.1:${PORTSDIR}/graphics/rubygem-opengl

GEM_NAME=	${DISTNAME}

USE_SDL=	mixer image ttf sdl
USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

.include <bsd.port.pre.mk>
.if ${RUBY_VER} == 1.9
BROKEN=	does not build with ruby 1.9
.endif
.include <bsd.port.post.mk>
