# New ports collection makefile for:   pear-DB_DataObject
# Date created:        23 August 2004
# Whom:                Antonio Carlos Venancio Junior (<antonio@php.net>)
#
# $FreeBSD$
#

PORTNAME=	DB_DataObject
PORTVERSION=	1.9.6
CATEGORIES=	databases pear

MAINTAINER=	miwi@FreeBSD.org
COMMENT=	An SQL Builder, Object Interface to Database Tables

BUILD_DEPENDS=	pear-DB>=1.7.0:${PORTSDIR}/databases/pear-DB \
		pear-Date>=1.4.3:${PORTSDIR}/devel/pear-Date
RUN_DEPENDS=	pear-DB>=1.7.0:${PORTSDIR}/databases/pear-DB \
		pear-Date>=1.4.3:${PORTSDIR}/devel/pear-Date

LATEST_LINK=	pear-${PORTNAME}
OPTIONS=	PEAR_MDB2 "PEAR::MDB2 support" off \
		PEAR_VALIDATE "PEAR::Validate support" off

PEAR_AUTOINSTALL=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_PEAR_MDB2)
RUN_DEPENDS+=	pear-MDB2>=2.3.0:${PORTSDIR}/databases/pear-MDB2
.endif

.if defined(WITH_PEAR_VALIDATE)
RUN_DEPENDS+=	pear-Validate>=0.1.1:${PORTSDIR}/devel/pear-Validate
.endif

.include "${PORTSDIR}/devel/pear/bsd.pear.mk"
.include <bsd.port.post.mk>
