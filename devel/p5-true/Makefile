# New ports collection makefile for:	p5-true
# Date created:		2011-11-05
# Whom:			Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	true
PORTVERSION=	0.18
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:CHOCOLATE
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Automatically return a true value when a file is required

BUILD_DEPENDS=	p5-B-Hooks-OP-Annotation>=0.43:${PORTSDIR}/devel/p5-B-Hooks-OP-Annotation \
		p5-B-Hooks-OP-Check>=0.18:${PORTSDIR}/devel/p5-B-Hooks-OP-Check \
		p5-Devel-StackTrace>=1.27:${PORTSDIR}/devel/p5-Devel-StackTrace \
		p5-ExtUtils-Depends>=0.304:${PORTSDIR}/devel/p5-ExtUtils-Depends
RUN_DEPENDS=	p5-B-Hooks-OP-Annotation>=0.43:${PORTSDIR}/devel/p5-B-Hooks-OP-Annotation \
		p5-B-Hooks-OP-Check>=0.18:${PORTSDIR}/devel/p5-B-Hooks-OP-Check \
		p5-Devel-StackTrace>=1.27:${PORTSDIR}/devel/p5-Devel-StackTrace

PERL_CONFIGURE=	yes

MAN3=		true.3 \
		true::VERSION.3

.include <bsd.port.mk>
