# New ports collection makefile for:	DBIx::Class::Tree
# Date created:		17 Mar 2011
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	DBIx-Class-Tree
PORTVERSION=	0.03003
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Perl extension to manipulate and anaylze tree structured data

RUN_DEPENDS=	\
	p5-DBIx-Class>=0.08100:${PORTSDIR}/databases/p5-DBIx-Class
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	DBIx::Class::Tree.3 \
	DBIx::Class::Tree::AdjacencyList.3 \
	DBIx::Class::Tree::AdjacencyList::Ordered.3

.include <bsd.port.mk>
