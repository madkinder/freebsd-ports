# New ports collection makefile for:	highlnk
# Date created:				20 Jun 2005
# Whom:					Emanuel Haupt <ehaupt@critical.ch>
#
# $FreeBSD$
#

PORTNAME=	highlnk
DISTVERSION=	0.2
CATEGORIES=	sysutils
MASTER_SITES=	http://perli.net/projekte/highlnk/ \
		CRITICAL

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	A tool to save disk space on hard disks by using hardlinks

MAKE_JOBS_SAFE=	yes

LICENSE=	GPLv2

PLIST_FILES=	bin/highlnk
PORTDOCS=	README
MAN1=		highlnk.1

post-patch:
	@${REINPLACE_CMD} -e 's|linux/limits.h|sys/syslimits.h|' \
		${WRKSRC}/finder.c \
		${WRKSRC}/highlnk.c
	@${REINPLACE_CMD} -e 's|^FLAGS.*|FLAGS = ${CFLAGS}|; s|^\(CC\).*|\1?=gcc|' \
		${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1

.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
