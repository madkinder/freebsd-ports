# New ports collection makefile for:	Catalyst-Action-REST
# Date created:	   08 August 2007
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD$
#

PORTNAME=	Catalyst-Action-REST
PORTVERSION=	0.91
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FLORA
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Automated REST Method Dispatching for Catalyst

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Catalyst-Runtime>=5.80:${PORTSDIR}/www/p5-Catalyst-Runtime \
		p5-Params-Validate>=0.76:${PORTSDIR}/devel/p5-Params-Validate \
		p5-YAML-Syck>=0.67:${PORTSDIR}/textproc/p5-YAML-Syck \
		p5-libwww>=2.033:${PORTSDIR}/www/p5-libwww \
		p5-Data-Serializer>=0.36:${PORTSDIR}/devel/p5-Data-Serializer \
		p5-Class-Inspector>=1.13:${PORTSDIR}/devel/p5-Class-Inspector \
		p5-MRO-Compat>=0.10:${PORTSDIR}/devel/p5-MRO-Compat \
		p5-URI-Find>=0:${PORTSDIR}/textproc/p5-URI-Find
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	--default

MAN3=		Catalyst::Action::Deserialize.3 Catalyst::Action::REST.3 \
		Catalyst::Action::REST::ForBrowsers.3 \
		Catalyst::Action::Serialize.3 Catalyst::Action::SerializeBase.3 \
		Catalyst::Controller::REST.3 Catalyst::Request::REST.3 \
		Catalyst::TraitFor::Request::REST.3 \
		Catalyst::Request::REST::ForBrowsers.3 \
		Catalyst::TraitFor::Request::REST::ForBrowsers.3

.include <bsd.port.mk>
