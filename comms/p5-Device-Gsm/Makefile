# New ports collection makefile for:	p5-Device-Gsm
# Date created:				09 May 2006
# Whom:					Anders Nordby <anders@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Device-Gsm
PORTVERSION=	1.55
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	anders@FreeBSD.org
COMMENT=	Perl interface to GSM phones/modems on serial ports

BUILD_DEPENDS=	${SITE_PERL}/Device/Modem.pm:${PORTSDIR}/comms/p5-Device-Modem
RUN_DEPENDS=	${SITE_PERL}/Device/Modem.pm:${PORTSDIR}/comms/p5-Device-Modem

PERL_CONFIGURE=	yes

MAN3=		Device::Gsm::Sms.3 Device::Gsm::Pdu.3 Device::Gsm.3

.include <bsd.port.mk>
