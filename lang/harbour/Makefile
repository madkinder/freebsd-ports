# New ports collection makefile for:	Harbour
# Date created:				9 May 2003
# Whom:					David G. Holm <harbour@netfang.net>
#
# $FreeBSD$
#

PORTNAME=	harbour
PORTVERSION=	2.0.0
CATEGORIES=	lang
MASTER_SITES=	SF/${PORTNAME}-project/source/${PORTVERSION}

MAINTAINER=	m.tsatsenko@gmail.com
COMMENT=	An open source Clipper-compatible compiler

LIB_DEPENDS=	slang.2:${PORTSDIR}/devel/libslang2\
		pcre:${PORTSDIR}/devel/pcre
BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash
RUN_DEPENDS:=	${BUILD_DEPENDS}

MAKE_JOBS_SAFE=	yes

USE_BISON=	build
USE_GMAKE=	yes

HB_WITHOUT_X11=	yes
HB_ARCH=	bsd
HB_COMPILER=	gcc
HB_GT_LIB=	gtsln

HB_BIN_INSTALL=	${LOCALBASE}/bin
HB_DOC_INSTALL=	${DOCSDIR}
HB_LIB_INSTALL=	${LOCALBASE}/lib
HB_INC_INSTALL=	${LOCALBASE}/include
HB_USER_CFLAGS=	-fPIC

MAKE_ENV=	HB_ARCHITECTURE=${HB_ARCH} \
		HB_COMPILER=${HB_COMPILER} \
		HB_GT_LIB=${HB_GT_LIB} \
		HB_BIN_INSTALL=${HB_BIN_INSTALL} \
		HB_LIB_INSTALL=${HB_LIB_INSTALL} \
		HB_INC_INSTALL=${HB_INC_INSTALL} \
		HB_WITHOUT_X11=${HB_WITHOUT_X11} \
		HB_USER_CFLAGS=${HB_USER_CFLAGS}

.if !defined(NOPORTDOCS)
MAKE_ENV+=	HB_DOC_INSTALL=${HB_DOC_INSTALL}
.endif

PORTDOCS=	*.txt en-EN

pre-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
BROKEN=		does not compile on sparc64: assertion failed
.elif ${OSVERSION} > 900007
BROKEN=		fails to build with new utmpx
.endif

.include <bsd.port.post.mk>
