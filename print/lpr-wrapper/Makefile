# New ports collection makefile for:    lpr-wrapper
# Date created:         22 Apr 2005 17:00:00 CEST
# Whom:                 e-masson@kisoft-services.com
#
# $FreeBSD$
#

PORTNAME=	lpr-wrapper
PORTVERSION=	0.6
PORTREVISION=	5
CATEGORIES=	print
MASTER_SITES=	http://www.mathstat.dal.ca/~selinger/lpr-wrapper/download/

MAINTAINER=	emss@free.fr
COMMENT=	A user level printer frontend

USE_GHOSTSCRIPT_RUN=	yes

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}

RUN_DEPENDS+=	bash:${PORTSDIR}/shells/bash
RUN_DEPENDS+=	ppdfilt:${PORTSDIR}/print/libppd
RUN_DEPENDS+=	psdim:${PORTSDIR}/print/psdim
RUN_DEPENDS+=	mpage:${PORTSDIR}/print/mpage
.if defined(A4)
RUN_DEPENDS+=	pstops:${PORTSDIR}/print/psutils-a4
.else
RUN_DEPENDS+=	pstops:${PORTSDIR}/print/psutils-letter
.endif

.include <bsd.port.mk>
