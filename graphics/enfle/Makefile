# New ports collection makefile for:	enfle
# Date created:		Tue Sep 28 02:25:17 JST 1999
# Whom:			Yuki Sawada <samy@goldmoon.org>
#
# $FreeBSD$
#

PORTNAME=	enfle
PORTVERSION=	20101006
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://enfle.fennel.org/files/stable/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Simple plugin-based graphics viewer

BUILD_DEPENDS=	${LOCALBASE}/lib/X11/rgb.txt:${PORTSDIR}/x11/rgb
LIB_DEPENDS=	arc.1:${PORTSDIR}/archivers/libarc \
		jasper.4:${PORTSDIR}/graphics/jasper \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		mng.1:${PORTSDIR}/graphics/libmng \
		ungif.5:${PORTSDIR}/graphics/libungif \
		png.6:${PORTSDIR}/graphics/png \
		theora.0:${PORTSDIR}/multimedia/libtheora
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS=	SIMD "Enable x86 SIMD (MMX/SSE)" off \
		AVCODEC "Enable libavcodec support" off

USE_LDCONFIG=	yes
USE_BZIP2=	yes
USE_XORG=	ice x11 xext xv
USE_GNOME=	esound
USE_ICONV=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	ac_cv_header_mpeg_h=no \
		ac_cv_header_libmpeg3_h=no \
		ac_cv_header_decore_h=no \
		ac_cv_header_avifile_h=no
CONFIGURE_ARGS=	--with-ungif

PKGDEINSTALL=	${PKGINSTALL}

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
CONFIGURE_ARGS+=	--enable-spi --enable-dmo
.if !defined(WITH_SIMD)
CONFIGURE_ARGS+=	--disable-mmx --disable-sse
.endif
.endif

.if ${ARCH} == "ia64" || ${ARCH} == "powerpc" || ${ARCH} == "sparc64"
BROKEN=		Does not compile on ia64, powerpc, or sparc64
.endif

.if ${OSVERSION} < 700000
PLIST_SUB+=	DISABLED="@comment "
.else
PLIST_SUB+=	DISABLED=""
.endif

.if defined(WITH_AVCODEC)
LIB_DEPENDS+=	avcodec:${PORTSDIR}/multimedia/ffmpeg
PLIST_SUB+=	AVCODEC=""
.else
CONFIGURE_ARGS+=	--disable-system-avcodec
PLIST_SUB+=	AVCODEC="@comment "
.endif

.if (${OSVERSION} >= 900000 && ${OSVERSION} < 900012) || ${OSVERSION} < 800505
LIB_DEPENDS+=	lzma.5:${PORTSDIR}/archivers/xz
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's|/usr/local/|${LOCALBASE}/|g ; \
		 s|/usr/X11R6/|${LOCALBASE}/|g ; \
		 /LIB/s|-lpthread|${PTHREAD_LIBS}|g ; \
		 /LIB/s|-lc_r|${PTHREAD_LIBS}|g ; \
		 /CFLAGS/s|-pthread|${PTHREAD_CFLAGS}|g ; \
		 /DLOPEN/s|-ldl||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		'/enfle -N/s|^|#|g' ${WRKSRC}/src/Makefile.in
	@${REINPLACE_CMD} -e \
		's|/usr/share/X11|${LOCALBASE}/lib/X11|g ; \
		 /X11R6/d' ${WRKSRC}/plugins/loader/xpm/xpm.c
.if ${OSVERSION} < 700000
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|effect|| ; \
		 /^SUBDIRS/s|audiodecoder|| ; \
		 /^SUBDIRS/s|videodecoder|| ; \
		 /^SUBDIRS/s|demultiplexer||' ${WRKSRC}/plugins/Makefile.in
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|tar||' ${WRKSRC}/plugins/archiver/Makefile.in
.endif

post-install:
	@${SETENV} PKG_PREFIX="${PREFIX}" \
		${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.post.mk>
