# New ports collection makefile for:	bglibs
# Date created:		03 Mar 2003
# Whom:			Sergei Kolobov <sergei@kolobov.com>
#
# $FreeBSD$
#

PORTNAME=	bglibs
PORTVERSION=	1.106
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	http://untroubled.org/${PORTNAME}/archive/ \
		http://untroubled.org/${PORTNAME}/

MAINTAINER=	sylvio@FreeBSD.org
COMMENT=	One stop library package by Bruce Guenter

LICENSE=	LGPL21

NOT_FOR_ARCHS=	alpha

USE_PERL5=	yes
USE_AUTOTOOLS=	libtool:env
LDFLAGS?=	-s
BGLIBS_INC=	${PREFIX}/include/${PORTNAME}
BGLIBS_LIB=	${PREFIX}/lib/${PORTNAME}
USE_LDCONFIG=	${BGLIBS_LIB}

DOCS=		NEWS README TODO doc/html/*
MAN1=		cli-generate.1

do-configure:
	${ECHO_CMD} "${CC} ${CFLAGS}"	> ${WRKSRC}/conf-cc
	${ECHO_CMD} "${CC} ${LDFLAGS}"	> ${WRKSRC}/conf-ld
	${ECHO_CMD} "${PREFIX}"		> ${WRKSRC}/conf-home
	${ECHO_CMD} "${PREFIX}/bin"	> ${WRKSRC}/conf-bin
	${ECHO_CMD} "${PREFIX}/man"	> ${WRKSRC}/conf-man
	${ECHO_CMD} "${BGLIBS_INC}"	> ${WRKSRC}/conf-include
	${ECHO_CMD} "${BGLIBS_LIB}"	> ${WRKSRC}/conf-lib

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

selftest: build
	cd ${WRKSRC} && ${SH} selftests.sh

.include <bsd.port.mk>
