# New ports collection makefile for:	p5-Path-Resource
# Date created:		2011-04-26
# Whom:			Steve Wills <swills@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Path-Resource
PORTVERSION=	0.072
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RKRIMEN
PKGNAMEPREFIX=	p5-

MAINTAINER=	swills@FreeBSD.org
COMMENT=	Perl module for combining local path manipulation and URI manipulation

BUILD_DEPENDS=	p5-Path-Abstract>0:${PORTSDIR}/devel/p5-Path-Abstract \
		p5-Path-Class>=0:${PORTSDIR}/devel/p5-Path-Class \
		p5-URI>=0:${PORTSDIR}/net/p5-URI \
		p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor
RUN_DEPENDS=	p5-Path-Abstract>0:${PORTSDIR}/devel/p5-Path-Abstract \
		p5-Path-Class>=0:${PORTSDIR}/devel/p5-Path-Class \
		p5-URI>=0:${PORTSDIR}/net/p5-URI \
		p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor

USE_PERL=	yes
PERL_CONFIGURE=	yes

MAN3=	Path::Resource.3 Path::Resource::Base.3

.include <bsd.port.mk>
