# New ports collection makefile for:	p5-Class-DBI-FromCGI
# Date created:	   21 july 2003
# Whom:		   mat
#
# $FreeBSD$
#

PORTNAME=	Class-DBI-FromCGI
PORTVERSION=	1.00
PORTREVISION=	1
CATEGORIES=	databases www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Update Class::DBI data using CGI::Untaint

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	${SITE_PERL}/Class/DBI.pm:${PORTSDIR}/databases/p5-Class-DBI \
		${SITE_PERL}/CGI/Untaint.pm:${PORTSDIR}/www/p5-CGI-Untaint

PERL_CONFIGURE=	yes

MAN3=		Class::DBI::FromCGI.3

.include <bsd.port.mk>
