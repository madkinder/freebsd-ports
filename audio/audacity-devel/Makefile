# New ports collection makefile for:	audacity-devel
# Date created:				14 Sep 2006
# Whom:					Jackson Low <xxjack12xx@gmail.com>
#
# $FreeBSD$

PORTNAME=	audacity
PORTVERSION=	1.3.13
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	GOOGLE_CODE \
		SF/${PORTNAME}/${PORTNAME}-unstable/${PORTVERSION}
PKGNAMESUFFIX=	-devel
DISTNAME=	${PORTNAME}-minsrc-${PORTVERSION}-beta

MAINTAINER=	xxjack12xx@gmail.com
COMMENT=	Audacity is a GUI editor for digital audio waveforms

LIB_DEPENDS=	sndfile.1:${PORTSDIR}/audio/libsndfile

CONFLICTS=	audacity-[0-9]*

WRKSRC=		${WRKDIR}/${PORTNAME}-src-${PORTVERSION}-beta

USE_AUTOTOOLS=	aclocal autoconf
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GCC=	4.6+
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_WX=		2.8+
WX_COMPS=	wx
MAKE_JOBS_SAFE=	yes
PORTDOCS=	README.txt LICENSE.txt
MAN1=		audacity.1
MANCOMPRESSED=	yes

OPTIONS=	DEBUG		"Debug support" off \
		FFMPEG		"Use ffmpeg for import and export support" on \
		FLAC		"Use libFLAC for FLAC support" on \
		ID3TAG		"Use libid3tag for mp3 id3 tag support" on \
		LADSPA		"LADSPA plug-in support" on \
		MAD		"Use libmad for mp2/3 decoding support"	on \
		MIDI		"Use portSMF for Midi support" on \
		NYQUIST		"Nyquist plug-in support" on \
		PORTMIXER	"Compile with PortMixer" on \
		SAMPLERATE	"Use libresample for sample rate conversion" on \
		SBSMS		"Use libsbsms for pitch and tempo changing" on \
		SOUNDTOUCH 	"Use libSoundTouch for pitch and tempo changing" on\
		TAGLIB		"Use TagLib for metadata support" on \
		TWOLAME		"Use libtwolame for MP2 export support" on \
		UNICODE		"Unicode support" on \
		VORBIS		"Use libvorbis for Ogg Vorbis support"	on \
		VAMP		"Use libvamp for Vamp plug-in support" on

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
SSE_CFLAGS=	-mno-sse -mno-sse2
.endif

ACLOCAL_ARGS+=	-I ${WRKSRC}/m4
AUTOCONF_ARGS+=	-I ${WRKSRC}/m4

CONFIGURE_ARG+	=--destdir=/
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}
CPPFLAGS+=	-I${WRKSRC}/lib-src/portsmf -I${WRKSRC}/lib-src/portaudio-v19/include -I${LOCALBASE}/include ${SSE_CFLAGS} ${PTHREAD_CFLAGS}
CXXFLAGS+=	-I${WRKSRC}/lib-src/portsmf -I${WRKSRC}/lib-src/portaudio-v19/include -I${LOCALBASE}/include ${SSE_CFLAGS} ${PTHREAD_CFLAGS}
CFLAGS+=	-I${WRKSRC}/lib-src/portsmf -I${WRKSRC}/lib-src/portaudio-v19/include -I${LOCALBASE}/include ${SSE_CFLAGS} ${PTHREAD_CFLAGS}

CONFIGURE_ENV+=	WX_CONFIG="${WX_CONFIG}"

.if !defined(NOPORTDOCS)
MAKE_ENV=	DOC=yes
.endif

CONFIGURE_ARGS+=	--with-lib-preference="local system"
CONFIGURE_ARGS+=	--with-portaudio
.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITH_FFMPEG)
CONFIGURE_ARGS+=	--with-ffmpeg
.endif

.if defined(WITH_FLAC)
CONFIGURE_ARGS+=	--with-libflac
.endif

.if defined(WITH_ID3TAG)
CONFIGURE_ARGS+=	--with-libid3tag
.endif

.if defined(WITH_LADSPA)
CONFIGURE_ARGS+=	--enable-ladspa
.endif

.if defined(WITH_MAD)
CONFIGURE_ARGS+=	--with-libmad
.endif

.if defined(WITH_MIDI)
CONFIGURE_ARGS+=	--with-midi
.endif

.if defined(WITH_NYQUIST)
CONFIGURE_ARGS+=	--enable-nyquist
.endif

.if defined(WITH_PORTMIXER)
CONFIGURE_ARGS+=	--with-portmixer
.endif

.if defined(WITH_SAMPLERATE)
CONFIGURE_ARGS+=	--with-libresample
.endif

.if defined(WITH_SBSMS)
CONFIGURE_ARGS+=	--with-sbsms
.endif

.if defined(WITH_SOUNDTOUCH)
CONFIGURE_ARGS+=	--with-soundtouch
.endif

.if defined(WITH_TWOLAME)
CONFIGURE_ARGS+=	--with-libtwolame
.endif

.if defined(WITH_TAGLIB)
CONFIGURE_ARGS+=	--with-taglib
.endif

.if defined(WITH_UNICODE)
WX_UNICODE=	yes
CONFIGURE_ARGS+=	--enable-unicode
.endif

.if defined(WITH_VAMP)
CONFIGURE_ARGS+=	--with-libvamp
.endif

.if defined(WITH_VORBIS)
CONFIGURE_ARGS+=	--with-libvorbis
.endif

.include <bsd.port.post.mk>
