# Ports collection makefile for:	pit
# Date created:				19 Mar 2011
# Whom:					Eric Freeman <freebsdports@chillibear.com>
#
# $FreeBSD$
#

PORTNAME=	pit
PORTVERSION=	0.1.0
CATEGORIES=	devel
MASTER_SITES=	http://github.com/michaeldv/${PORTNAME}/tarball/
DISTNAME=	${PORTVERSION}
EXTRACT_SUFX=	# none

MAINTAINER=	freebsdports@chillibear.com
COMMENT=	Command-line project manager that integrates with Git

FETCH_ARGS=	-pRr
WRKSRC=		"${WRKDIR}/michaeldv-${PORTNAME}-fd6b3ef"
PLIST_FILES=	bin/pit

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/pit ${PREFIX}/bin

.include <bsd.port.mk>
