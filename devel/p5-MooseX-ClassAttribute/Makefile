# New ports collection makefile for:	MooseX-ClassAttribute
# Date created:	   07 Jun 2008
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD$
#

PORTNAME=	MooseX-ClassAttribute
PORTVERSION=	0.26
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DROLSKY
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Declare class attributes Moose-style

LICENSE=	ART20

BUILD_DEPENDS=	p5-Moose>=1.23:${PORTSDIR}/devel/p5-Moose \
		p5-namespace-autoclean>=0:${PORTSDIR}/devel/p5-namespace-autoclean
RUN_DEPENDS:=	${BUILD_DEPENDS}

TEST_DEPENDS=	p5-Test-Requires>=0:${PORTSDIR}/devel/p5-Test-Requires \
		p5-Test-Fatal>=0:${PORTSDIR}/devel/p5-Test-Fatal

PERL_CONFIGURE=	yes

MAN3=		MooseX::ClassAttribute.3 \
		MooseX::ClassAttribute::Meta::Role::Attribute.3 \
		MooseX::ClassAttribute::Trait::Application.3 \
		MooseX::ClassAttribute::Trait::Application::ToClass.3 \
		MooseX::ClassAttribute::Trait::Application::ToRole.3 \
		MooseX::ClassAttribute::Trait::Attribute.3 \
		MooseX::ClassAttribute::Trait::Class.3 \
		MooseX::ClassAttribute::Trait::Mixin::HasClassAttributes.3 \
		MooseX::ClassAttribute::Trait::Role.3 \
		MooseX::ClassAttribute::Trait::Role::Composite.3

.include <bsd.port.mk>
