# New ports collection makefile for:	csound
# Date created:				2000-10-11
# Whom:					trevor
#
# $FreeBSD$
#

PORTNAME=	csound
PORTVERSION=	5.13
CATEGORIES=	audio lang
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}5/${PORTNAME}5.13/:src \
		SF/${PORTNAME}/${PORTNAME}5/${PORTNAME}5.13/manual:manual
MASTER_SITE_SUBDIR=	${PORTNAME:S/$/:src/}
DISTNAME=	${PORTNAME:S/c/C/}${PORTVERSION}.0
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:src
DIST_SUBDIR=	csound

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Sound synthesizer

LIB_DEPENDS=	sndfile:${PORTSDIR}/audio/libsndfile
BUILD_DEPENDS=	${LOCALBASE}/bin/swig:${PORTSDIR}/devel/swig13 \
		${LOCALBASE}/bin/bison:${PORTSDIR}/devel/bison

BROKEN=		does not package

WRKSRC=		${WRKDIR}/${DISTNAME}/
USE_PYTHON=	2.6+
USE_SCONS=	yes
SCONS_ARGS+=	prefix=${PREFIX} CC=${CC} CXX=${CXX} \
		usePortAudio=0 usePortMIDI=0 useALSA=0 \
		useJack=0 buildCsoundAC=0 buildCsoundVST=0 \
		buildRelease=1 install=1 useCoreAudio=1 \
		buildWinsound=1 buildInterfaces=1 \
		buildVirtual=1 buildCSEditor=1 buildDSSI=0 \
		useGettext=1 dynamicCsoundLibrary=1 useDouble=1

CONFLICTS_INSTALL=	outguess-*

OPTIONS=	FLTKGUI "Build fltk plugin and GUI" on

.include <bsd.port.pre.mk>

USE_GETTEXT=	yes
SUB_FILES=	custom.py pkg-message
SUB_LIST+=	PYTHON_INCLUDEDIR=${PYTHON_INCLUDEDIR} \
		PYTHON_SITELIBDIR=${PYTHON_SITELIBDIR}
USE_LDCONFIG=	yes

.if !defined(WITHOUT_FLTKGUI)
LIB_DEPENDS+=	fltk.1:${PORTSDIR}/x11-toolkits/fltk
PLIST_SUB+=	FLTKGUI=""
SCONS_ARGS+=	useFLTK=1 buildCsound5GUI=1
.else
PLIST_SUB+=	FLTKGUI="@comment "
SCONS_ARGS+=	useFLTK=0 buildCsound5GUI=0
.endif

.if !defined(NOPORTDOCS)
BUILD_DEPENDS+=		${LOCALBASE}/bin/unzip:${PORTSDIR}/archivers/unzip
DISTFILES+=	Csound5.13_manual_html.zip:manual
.endif

post-patch: apply-slist
	@${MV} ${WRKDIR}/custom.py ${WRKSRC}
	@${REINPLACE_CMD} -e "s|'unsupported'|'linux'|; \
		s|ENV = {'PATH' : os.environ\['PATH'\]}|ENV = os.environ|; \
		s|'csPerfThread.hpp'|'interfaces/csPerfThread.hpp'|; \
		s|'5.2'|'5'|; \
		s|'dl'|''|; \
		s|'asound'|''|;" \
		${WRKSRC}/SConstruct
	@${REINPLACE_CMD} 's|linux/if.h|net/if.h|' ${WRKSRC}/OOps/remote.c
	@${REINPLACE_CMD} 's|malloc.h|stdlib.h|' \
		${WRKSRC}/frontends/CsoundAC/Counterpoint.hpp

post-install:
	${LN} -s libcsound64.so.5 ${PREFIX}/lib/libcsound64.so
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	@${ECHO_MSG} " Installing the manual."
	cd ${WRKDIR}/html && ${COPYTREE_SHARE} . ${DOCSDIR}
	@${ECHO_MSG} " Done."
.endif
	@${ECHO_MSG} " Moving ${PREFIX}/bin/mixer to ${PREFIX}/bin/csmixer"
	@${ECHO_MSG} " This is to prevent conflicts with /usr/bin/mixer"
	${MV} ${PREFIX}/bin/mixer ${PREFIX}/bin/csmixer
	@${ECHO_MSG} " Done."
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
