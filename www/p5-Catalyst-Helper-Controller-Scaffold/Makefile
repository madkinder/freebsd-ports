# New ports collection makefile for:	www/p5-Catalyst-Helper-Controller-Scaffold
# Date created:		2005-07-11
# Whom:			Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Catalyst-Helper-Controller-Scaffold
PORTVERSION=	0.04
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Catalyst helper for Scaffolding

BUILD_DEPENDS=	${SITE_PERL}/Catalyst.pm:${PORTSDIR}/www/p5-Catalyst-Runtime \
		p5-Catalyst-Devel>=1.00:${PORTSDIR}/www/p5-Catalyst-Devel \
		${SITE_PERL}/Catalyst/Plugin/FormValidator.pm:${PORTSDIR}/www/p5-Catalyst-Plugin-FormValidator \
		${SITE_PERL}/Catalyst/View/TT.pm:${PORTSDIR}/www/p5-Catalyst-View-TT \
		${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/Class/DBI/AsForm.pm:${PORTSDIR}/databases/p5-Class-DBI-AsForm \
		${SITE_PERL}/Class/DBI/FromForm.pm:${PORTSDIR}/www/p5-Class-DBI-FromForm \
		${SITE_PERL}/Path/Class.pm:${PORTSDIR}/devel/p5-Path-Class \
		${SITE_PERL}/Template/Plugin/Class.pm:${PORTSDIR}/www/p5-Template-Plugin-Class
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Catalyst::Helper::Controller::Scaffold.3

.include <bsd.port.mk>
