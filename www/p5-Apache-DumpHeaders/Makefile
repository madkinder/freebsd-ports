# New ports collection makefile for:    p5-Apache-DumpHeaders
# Date created:				2002-05-31
# Whom:					nork@FreeBSD.org
#
# $FreeBSD$
#

PORTNAME=	Apache-DumpHeaders
PORTVERSION=	0.94
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Watches HTTP transactions under mod_perl, looking at the headers

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/mod_perl.pm:${PORTSDIR}/www/mod_perl

DEPRECATED=	depends on mod_perl
EXPIRATION_DATE=	2012-01-01

PERL_CONFIGURE=	yes

MAN3=		Apache::DumpHeaders.3 Apache::ProxyPassThru.3

.include <bsd.port.mk>
