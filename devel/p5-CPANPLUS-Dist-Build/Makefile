# New ports collection makefile for:	p5-CPANPLUS-Dist-Build
# Date created:		18 August 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	CPANPLUS-Dist-Build
PORTVERSION=	0.60
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	CPANPLUS plug-in to use Module-Build

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

PERL_CONFIGURE=	yes

MAN3=		CPANPLUS::Dist::Build.3 CPANPLUS::Dist::Build::Constants.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501001
RUN_DEPENDS+=	p5-IPC-Cmd>=0.42:${PORTSDIR}/devel/p5-IPC-Cmd \
		p5-Module-Build>=0.32:${PORTSDIR}/devel/p5-Module-Build \
		p5-Module-Load>=0.16:${PORTSDIR}/devel/p5-Module-Load \
		p5-Module-Load-Conditional>=0.30:${PORTSDIR}/devel/p5-Module-Load-Conditional
.endif

.if ${PERL_LEVEL} < 501000
RUN_DEPENDS+=	p5-CPANPLUS>=0.84:${PORTSDIR}/devel/p5-CPANPLUS
.endif

.if ${PERL_LEVEL} < 500905
RUN_DEPENDS+=	p5-Locale-Maketext-Simple>=0:${PORTSDIR}/devel/p5-Locale-Maketext-Simple \
		p5-Params-Check>=0.26:${PORTSDIR}/devel/p5-Params-Check
.endif

.include <bsd.port.post.mk>
