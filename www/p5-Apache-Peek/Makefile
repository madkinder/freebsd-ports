# New ports collection makefile for:	p5-Apache-Peek
# Date created:		24-Jul-2000
# Whom:			Leo Kim <leo@florida.sarang.net>
#
# $FreeBSD$
#

PORTNAME=	Apache-Peek
PORTVERSION=	1.02
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:STAS
PKGNAMEPREFIX=	p5-

MAINTAINER=	skv@FreeBSD.org
COMMENT=	A data debugging tool for the XS programmer (under mod_perl)

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2012-01-01

# Changed to apache13 exclusive, else apache13 ports
# are broken if apache22 is set as default
USE_APACHE=	13
PERL_CONFIGURE=	YES

CONFIGURE_ARGS=	-httpd ${LOCALBASE}/sbin/httpd

MAN3=		Apache::Peek.3

.include <bsd.port.pre.mk>

.if defined(WITH_MODPERL2) || ${APACHE_VERSION} > 13
IGNORE=		broken due the new mod_perl2 API
BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Apache2/mod_perl.pm:${PORTSDIR}/www/mod_perl2
MOD_PERL=	2
.else
BUILD_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/mod_perl.pm:${PORTSDIR}/www/mod_perl \
		${SITE_PERL}/${PERL_ARCH}/Apache/Test.pm:${PORTSDIR}/www/p5-Apache-Test
MOD_PERL=	1
.endif

RUN_DEPENDS:=	${BUILD_DEPENDS}

post-patch:
	@${PERL} -pi -e '$$_="" if /^test_configure\(/;' ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
