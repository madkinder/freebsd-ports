# New ports collection makefile for:	Yada-Yada-Yada
# Date created:				21 May 2006
# Whom:					Aaron Dalton <aaron@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Yada-Yada-Yada
PORTVERSION=	1.00
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TMTM
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Adds a Yada-Yada-Yada operator (...) to Perl 5

BUILD_DEPENDS=	${SITE_PERL}/Filter/Simple.pm:${PORTSDIR}/textproc/p5-Filter-Simple
RUN_DEPENDS=	${BUILD_DEPENDS}

MAN3=	Yada::Yada::Yada.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
