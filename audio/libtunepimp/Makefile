# New ports collection makefile for:	tunepimp
# Date Created:				11 Aug 2004
# Whom:					Lauri Watts <lauri@kde.org>
#
# $FreeBSD$
#

PORTNAME=	libtunepimp
PORTVERSION=	0.5.3
PORTREVISION=	9
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	http://ftp.musicbrainz.org/pub/musicbrainz/ \
		ftp://ftp.au.musicbrainz.org/pub/musicbrainz/

MAINTAINER=	bsdkaffee@gmail.com
COMMENT=	Client library for musicbrainz

LIB_DEPENDS=	FLAC:${PORTSDIR}/audio/flac \
		expat:${PORTSDIR}/textproc/expat2 \
		mad:${PORTSDIR}/audio/libmad \
		mp4v2.10:${PORTSDIR}/multimedia/mp4v2 \
		musicbrainz:${PORTSDIR}/audio/libmusicbrainz \
		ogg:${PORTSDIR}/audio/libogg \
		tag:${PORTSDIR}/audio/taglib \
		vorbis:${PORTSDIR}/audio/libvorbis \
		ofa:${PORTSDIR}/audio/libofa \
		mpcdec:${PORTSDIR}/audio/musepack

CONFLICTS=	trm-0*
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS=|#CFLAGS=|g ; \
		 s|^CPPFLAGS=|#CPPFLAGS=|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|-lthr|${PTHREAD_LIBS}|g' \
		${WRKSRC}/lib/threads/posix/Makefile.in
	@${REINPLACE_CMD} -e 's|<mp4\.h>|<mp4v2/mp4v2.h>|g' \
		${WRKSRC}/plugins/mp4/mp4.cpp

post-configure:
	@${REINPLACE_CMD} -e 's|\(^LDFLAGS =.*\)|\1 ${PTHREAD_LIBS} -liconv|g' \
		${WRKSRC}/examples/Makefile
	@${REINPLACE_CMD} -e 's|plugins/wv|plugins/tta|' \
		${WRKSRC}/plugins/tta/Makefile

.include <bsd.port.mk>
