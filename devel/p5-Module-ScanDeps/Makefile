# New ports collection makefile for:	devel/p5-Module-ScanDeps
# Date created:				Aug 27 2003
# Whom:					Autrijus Tang <autrijus@autrijus.org>
#
# $FreeBSD$
#

PORTNAME=	Module-ScanDeps
PORTVERSION=	1.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:RSCHUPP
PKGNAMEPREFIX=	p5-

MAINTAINER=	rafan@FreeBSD.org
COMMENT=	Recursively scan Perl code for dependencies

PERL_CONFIGURE=	yes

MAN1=		scandeps.pl.1
MAN3=		Module::ScanDeps.3

post-patch:
	@${REINPLACE_CMD} -e \
		's|/usr/bin/perl|${PERL}|' ${WRKSRC}/script/scandeps.pl \
		${WRKSRC}/Makefile.PL

regression-test:
	cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500904
RUN_DEPENDS+=	p5-Module-Build>=0:${PORTSDIR}/devel/p5-Module-Build
.endif

.if ${PERL_LEVEL} < 500900
RUN_DEPENDS+=	p5-version>=0:${PORTSDIR}/devel/p5-version
.endif

.include <bsd.port.post.mk>
