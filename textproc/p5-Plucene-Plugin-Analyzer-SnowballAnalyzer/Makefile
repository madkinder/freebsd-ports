# New ports collection makefile for:	textproc/p5-Plucene-Plugin-Analyzer-SnowballAnalyzer
# Date created:				14 October 2004
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Plucene-Plugin-Analyzer-SnowballAnalyzer
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FABPOT
PKGNAMEPREFIX=	p5-

MAINTAINER=	tobez@FreeBSD.org
COMMENT=	Stemmed analyzer plugin for p5-Plucene search engine

BUILD_DEPENDS=	${SITE_PERL}/Lingua/StopWords.pm:${PORTSDIR}/textproc/p5-Lingua-StopWords \
		${SITE_PERL}/${PERL_ARCH}/Lingua/Stem/Snowball.pm:${PORTSDIR}/textproc/p5-Lingua-Stem-Snowball \
		${SITE_PERL}/Plucene/Analysis/TokenFilter.pm:${PORTSDIR}/textproc/p5-Plucene
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Plucene::Plugin::Analyzer::SnowballAnalyzer.3 \
	Plucene::Plugin::Analyzer::SnowballFilter.3

.include <bsd.port.mk>
