# New ports collection makefile for:	deskutils/p5-Data-ICal
# Date created:				10 November 2005
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Data-ICal
PORTVERSION=	0.17
CATEGORIES=	deskutils perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JESSE
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Data::ICal - Generates iCalendar (RFC 2445) calendar files

BUILD_DEPENDS=	p5-Class-Accessor>=0:${PORTSDIR}/devel/p5-Class-Accessor \
		p5-Class-ReturnValue>=0:${PORTSDIR}/devel/p5-Class-ReturnValue \
		p5-Text-vFile-asData>=0:${PORTSDIR}/devel/p5-Text-vFile-asData
RUN_DEPENDS:=	${BUILD_DEPENDS}

TEST_DEPENDS=	p5-Test-LongString>=0:${PORTSDIR}/devel/p5-Test-LongString \
		p5-Test-NoWarnings>=0:${PORTSDIR}/devel/p5-Test-NoWarnings \
		p5-Test-Pod>=1.14:${PORTSDIR}/devel/p5-Test-Pod \
		p5-Test-Pod-Coverage>=1.04:${PORTSDIR}/devel/p5-Test-Pod-Coverage \
		p5-Test-Warn>=0:${PORTSDIR}/devel/p5-Test-Warn

PERL_CONFIGURE=	yes

MAN3=	Data::ICal.3 \
	Data::ICal::Entry.3 \
	Data::ICal::Entry::Alarm::Audio.3 \
	Data::ICal::Entry::Alarm::Display.3 \
	Data::ICal::Entry::Alarm::Email.3 \
	Data::ICal::Entry::Alarm::Procedure.3 \
	Data::ICal::Entry::Event.3 \
	Data::ICal::Entry::FreeBusy.3 \
	Data::ICal::Entry::Journal.3 \
	Data::ICal::Entry::TimeZone.3 \
	Data::ICal::Entry::TimeZone::Daylight.3 \
	Data::ICal::Entry::TimeZone::Standard.3 \
	Data::ICal::Entry::Todo.3 \
	Data::ICal::Property.3

post-patch:
	@${REINPLACE_CMD} -e '/^auto_install/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
