# New ports collection makefile for:	p5-Spread-Message
# Date created:				12 Jun 2006
# Whom:					Aaron Dalton <aaron@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Spread-Message
PORTVERSION=	0.21
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MARKPF
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Provide messaging using the Spread toolkit

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Spread.pm:${PORTSDIR}/net/spread
RUN_DEPENDS=	${BUILD_DEPENDS}

MAN3=	Spread::Message.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
