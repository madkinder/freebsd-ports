# New ports collection makefile for:	p5-AnyEvent-HTTPD
# Date created:		2009-07-17
# Whom:			Mons Anderson <mons@cpan.org>
#
# $FreeBSD$
#

PORTNAME=	AnyEvent-HTTPD
PORTVERSION=	0.84
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ELMEX
PKGNAMEPREFIX=	p5-

MAINTAINER=	mons@cpan.org
COMMENT=	A simple lightweight event based web server

RUN_DEPENDS=	p5-AnyEvent>=0:${PORTSDIR}/devel/p5-AnyEvent \
		p5-Object-Event>=1.21:${PORTSDIR}/devel/p5-Object-Event \
		p5-common-sense>=2.0:${PORTSDIR}/devel/p5-common-sense \
		p5-URI>=1.40:${PORTSDIR}/net/p5-URI

PERL_CONFIGURE=	yes

MAN3=	AnyEvent::HTTPD.3 AnyEvent::HTTPD::Request.3 AnyEvent::HTTPD::Util.3 AnyEvent::HTTPD::HTTPServer.3 AnyEvent::HTTPD::HTTPConnection.3

.include <bsd.port.mk>
