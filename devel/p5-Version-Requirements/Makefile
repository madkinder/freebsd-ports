# New ports collection makefile for:	p5-Version-Requirements
# Date created:				April 20 2010
# Whom:					jupengfei <jupengfei@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	Version-Requirements
PORTVERSION=	0.101020
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RJBS
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	A set of version requirements for a CPAN dist

PERL_CONFIGURE=	yes

MAN3=		Version::Requirements.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
BUILD_DEPENDS+=	p5-version>=0.77:${PORTSDIR}/devel/p5-version
RUN_DEPENDS+=	p5-version>=0.77:${PORTSDIR}/devel/p5-version
TEST_DEPENDS+=	p5-Test-Simple>=0.88:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
