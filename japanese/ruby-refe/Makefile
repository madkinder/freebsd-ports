# New ports collection makefile for:	ReFe
# Date created:		24 November 2002
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $FreeBSD$
#

PORTNAME=	refe
PORTVERSION=	0.8.0
CATEGORIES=	japanese lang ruby
MASTER_SITES=	http://www.loveruby.net/archive/refe/${PORTNAME}/ \
  LOCAL/pgollucci
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-${PORTVERSION}-withdoc
DIST_SUBDIR=	ruby

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Ruby Reference Referrer

BROKEN=		incomplete plist

USE_RUBY=	yes
USE_RUBY_SETUP=	yes

WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}

DOCS_EN=	ChangeLog	NEWS	TODO \
		README.en
DOCS_JA=	README.ja

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${RUBY_MODDOCDIR}/ja
.for f in ${DOCS_EN}
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/
.endfor
.for f in ${DOCS_JA}
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/ja/
.endfor
.endif

.include <bsd.port.mk>
