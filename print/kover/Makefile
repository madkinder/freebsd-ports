# New ports collection makefile for:	kover
# Date created:			Mon Dec 29 05:07:17 CET 2003
# Whom:				Markus Brueffer <brueffer@phoenix-systems.de>
#
# $FreeBSD$

PORTNAME=		kover
PORTVERSION=		2.9.5
PORTREVISION=	9
CATEGORIES=		print kde
MASTER_SITES=		http://lisas.de/kover/

MAINTAINER=		ports@FreeBSD.org
COMMENT=		WYSIWYG CD cover printer

EXTRA_PATCHES=		${.CURDIR}/../../x11/kde3/files/extrapatch-old_configure

USE_KDELIBS_VER=	3
USE_GMAKE=		yes
USE_AUTOTOOLS=		libtool

MAN1=	kover.1 cddb-id.1

post-extract:
	@${TOUCH} -t 200404270000 ${WRKSRC}/Makefile.am.in
	@${TOUCH} -t 200404270001 ${WRKSRC}/subdirs

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
