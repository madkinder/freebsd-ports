# Ports collection Makefile for:		p5-AxKit-XSP-Param
# Date created:					8 Jan 2002
# Whom:						dom@happygiraffe.net
#
# $FreeBSD$
#

PORTNAME=	AxKit-XSP-Param
PORTVERSION=	1.4
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MSERGEANT
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	A namespace wrapper for accessing HTTP request paramaters

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/AxKit.pm:${PORTSDIR}/www/p5-AxKit
RUN_DEPENDS=	${BUILD_DEPENDS}

DEPRECATED=	depends on p5-AxKit
EXPIRATION_DATE=	2012-01-01

MAN3=		AxKit::XSP::Param.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
