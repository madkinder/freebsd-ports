# New ports collection makefile for:	grig
# Date created:				2004-01-22
# Whom:					Matt Dawson <matt@mattsnetwork.co.uk>
#
# $FreeBSD$
#

PORTNAME=	grig
PORTVERSION=	0.8.0
CATEGORIES=	comms hamradio
MASTER_SITES=	SF/groundstation/Grig/${PORTVERSION}

MAINTAINER=	matt@chronos.org.uk
COMMENT=	Amateur Radio control front-end

LICENSE=	GPLv2

LIB_DEPENDS=	hamlib:${PORTSDIR}/comms/hamlib

USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes

MAN1=		grig.1

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.* | ${XARGS} ${REINPLACE_CMD} -e \
		's|-D.*_DISABLE_DEPRECATED||g'

.include <bsd.port.mk>
