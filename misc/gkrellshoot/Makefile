# New ports collection makefile for:	gkrellshoot
# Date Created:			7 Mar 2002
# Whom:				Andrew Stuart <elitetek@tekrealm.net>
#
# $FreeBSD$
#

PORTNAME=	gkrellshoot
PORTVERSION=	0.3.2
PORTREVISION=	8
CATEGORIES=	misc
MASTER_SITES=	SF

MAINTAINER=	elitetek@tekrealm.net
COMMENT=	A screen locking and screen capture plugin for GKrellM

BUILD_DEPENDS=	${LOCALBASE}/include/gkrellm/gkrellm.h:${PORTSDIR}/sysutils/gkrellm
RUN_DEPENDS=	gkrellm:${PORTSDIR}/sysutils/gkrellm \
		import:${PORTSDIR}/graphics/ImageMagick

PLIST_FILES=	libexec/gkrellm/plugins/gkrellshoot.so
WRKSRC=		${WRKDIR}/gkrellShoot-${PORTVERSION}
USE_GNOME=	imlib

.include <bsd.port.mk>
