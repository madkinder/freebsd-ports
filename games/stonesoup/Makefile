# New ports collection makefile for:	dcss
# Date created:		2008-07-11
# Whom:			Tobias Rehbein <tobias.rehbein@web.de>
#
# $FreeBSD$
#

PORTNAME=	stonesoup
PORTVERSION=	0.9.1
CATEGORIES=	games
MASTER_SITES=	SF/crawl-ref/Stone%20Soup/${PORTVERSION}
DISTNAME=	stone_soup-${PORTVERSION}-nodeps

MAINTAINER=	tobias.rehbein@web.de
COMMENT=	Dungeon Crawl Stone Soup - a fun, free rogue-like game

LICENSE=	GPLv2
LICENSE_FILE=	${WRKDIR}/stone_soup-${PORTVERSION}/licence.txt

USE_SQLITE=	yes
USE_BZIP2=	yes
USE_BISON=	build
USE_GMAKE=	yes
USE_LUA=	5.1
USE_PERL5_BUILD=	yes
USE_GCC=	4.2+

MAKE_JOBS_SAFE=	yes

SAVEDIR=	\~/.stonesoup
WRKSRC=		${WRKDIR}/stone_soup-${PORTVERSION}/source/

SUB_FILES=	README.FreeBSD
PLIST_SUB=	SAVEDIR="${SAVEDIR}"

OPTIONS=	SOUND		"Sound support"			off \
		WIZARD		"Wizard mode"			off \
		LUA_BINDINGS	"Bindings for LUA user scripts"	off

MAKEFILE=	makefile
MAKE_ARGS=	prefix=${PREFIX} \
		DATADIR=${DATADIR} \
		SAVEDIR=${SAVEDIR} \
		INSTALL_UGRP=root:games \
		NO_AUTOOPT=YesPlease \
		NO_OPTIMIZE=YesPlease \
		LUA_INCLUDE_DIR=${LOCALBASE}/include/lua51 \
		LUA_LIB=-llua-5.1 \
		SQLITE_INCLUDE_DIR=${LOCALBASE}/include \
		SQLITE_LIB=-lsqlite3 \
		LDFLAGS="-L${LOCALBASE}/lib -L${LOCALBASE}/lib/lua51"

.include <bsd.port.options.mk>

.if ${CC} == "clang" || ${CXX} == "clang++"
BROKEN=		requires gcc at this time
.endif

.if defined(VERBOSE)
MAKE_ARGS+=	V=yes
.endif

.if defined(WITH_WIZARD)
MAKE_ARGS+=	wizard
.endif

.if defined(WITH_SDL)
CONFLICTS+=	${PORTNAME}-[0-9]*
MAKE_ARGS+=	TILES=y
PLIST_SUB+=	SDL=""
PKGNAMESUFFIX=	-sdl
BUILD_DEPENDS+=	pkg-config:${PORTSDIR}/devel/pkg-config
LIB_DEPENDS+=	png.6:${PORTSDIR}/graphics/png \
		freetype:${PORTSDIR}/print/freetype2
USE_SDL=	sdl image
.else
USE_NCURSES=	yes
CONFLICTS+=	${PORTNAME}-sdl-[0-9]*
PLIST_SUB+=	SDL="@comment "
.endif

.if defined(WITH_SOUND)
RUN_DEPENDS+=	sox:${PORTSDIR}/audio/sox
.endif

.if defined(WITHOUT_LUA_BINDINGS)
MAKE_ARGS+=	NO_LUA_BINDINGS=yes
.endif

post-patch:
.if defined(WITH_SOUND)
	@${REINPLACE_CMD} -e "s,%%LOCALBASE%%,${LOCALBASE}," ${WRKSRC}/AppHdr.h
	@${REINPLACE_CMD} -e "s,%%SOUND%%,," ${WRKSRC}/AppHdr.h
.else
	@${REINPLACE_CMD} -e "s,%%SOUND%%,// ," ${WRKSRC}/AppHdr.h
.endif

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKDIR}/README.FreeBSD ${DOCSDIR}
.endif
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${DATADIR}/settings/init.txt ${EXAMPLESDIR}/sample.crawlrc
.endif

.include <bsd.port.mk>
