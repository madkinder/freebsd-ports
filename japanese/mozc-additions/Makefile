# New ports collection makefile for:	mozc-additions
# Date created:				26 June 2010
# Whom:					Daichi GOTO <daichi@freebsd.org>
#
# $FreeBSD$
#

PORTNAME=	mozc-additions
PORTVERSION=	0.12.434.102
CATEGORIES=	japanese
MASTER_SITES=	http://people.freebsd.org/~daichi/distfiles/

MAINTAINER=	daichi@FreeBSD.org
COMMENT=	Additional tools and images for Mozc Japanese Input Method

NO_BUILD=	yes
REPLACE_FILES=	${WRKSRC}/Makefile

post-patch:
	@for FILE in ${REPLACE_FILES}; \
	do \
	    ${SED} -i .bak -e "s/@@LOCALBASE@@/${LOCALBASE:S/\//\\\//g}/g" \
	    $${FILE}; \
	done;

.include <bsd.port.mk>
