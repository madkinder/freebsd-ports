# New ports collection makefile for:	p5-Catalyst-Engine-Apache
# Date created:		15 Nov 2005
# Whom:			Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Catalyst-Engine-Apache
PORTVERSION=	1.16
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Catalyst Apache Engines

RUN_DEPENDS=	p5-Catalyst-Runtime>=5.80:${PORTSDIR}/www/p5-Catalyst-Runtime

PERL_CONFIGURE=	yes

MAN3=		Catalyst::Engine::Apache.3 \
		Catalyst::Engine::Apache2.3 \
		Catalyst::Engine::Apache2::MP19.3 \
		Catalyst::Engine::Apache2::MP20.3 \
		Catalyst::Engine::Apache::MP13.3

.include <bsd.port.mk>
