# New ports collection makefile for:	corkscrew
# Date created:			Apr 12, 2001
# Whom:				Mark Pulford <mark@kyne.com.au>
#
# $FreeBSD$
#

PORTNAME=	corkscrew
PORTVERSION=	2.0
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://www.agroman.net/corkscrew/ \
		CRITICAL

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	A HTTP tunnelling utility for SSH

GNU_CONFIGURE=	yes

LICENSE=	GPLv2

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
