# New ports collection makefile for:	sdcc
# Date created:		3 May 2004
# Whom:			Tijl Coosemans <tijl@ulyssis.org>
#
# $FreeBSD$
#

PORTNAME=	sdcc
PORTVERSION=	3.0.2.2011.03.21
CATEGORIES=	lang
MASTER_SITES=	SF/sdcc/snapshot_builds/sdcc-src/ \
		http://tijl.fastmail.fm/mirror/
DISTNAME=	${PORTNAME}-src-20110321-6331

MAINTAINER=	tijl@coosemans.org
COMMENT=	Small Device C Compiler

WRKSRC=		${WRKDIR}/sdcc

GNU_CONFIGURE=	yes
NO_LATEST_LINK=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes

OPTIONS=	MCS51   "Intel 8051 port" on \
		Z80     "Zilog Z80 port" on \
		AVR     "AVR port" on \
		DS390   "Maxim 80DS390/DS400 port" on \
		PIC     "Microchip PIC16 series port" on \
		PIC16   "Microchip PIC18 series port" on \
		XA51    "Philips XA51 port" on \
		HC08    "Motorola 68HC08 port" on \
		DEVLIB  "Device libraries" on \
		UCSIM   "The ucSim simulator" on \
		PACKIHX "A tool to pack (compress) Intel hex files" on

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--docdir=${DOCSDIR}

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
BROKEN=		Does not compile on sparc64
.endif

.if defined(WITHOUT_MCS51) && defined(WITHOUT_DS390)
CONFIGURE_ARGS+=	--disable-51
PLIST_SUB+=		MCS51DS390="@comment "
.else
USE_AUTOTOOLS+=		autoconf
PLIST_SUB+=		MCS51DS390=""
.endif

.if defined(WITHOUT_MCS51)
CONFIGURE_ARGS+=	--disable-mcs51-port
PLIST_SUB+=		MCS51="@comment "
.else
PLIST_SUB+=		MCS51=""
.endif

.if defined(WITHOUT_Z80)
CONFIGURE_ARGS+=	--disable-gbz80-port --disable-z80-port --disable-z80
PLIST_SUB+=		Z80="@comment "
.else
PLIST_SUB+=		Z80=""
.endif

.if defined(WITHOUT_AVR)
CONFIGURE_ARGS+=	--disable-avr
PLIST_SUB+=		AVR="@comment "
.else
CONFIGURE_ARGS+=	--enable-avr-port
PLIST_SUB+=		AVR=""
.endif

.if defined(WITHOUT_DS390)
CONFIGURE_ARGS+=	--disable-ds390-port --disable-ds400-port
PLIST_SUB+=		DS390="@comment "
.else
PLIST_SUB+=		DS390=""
.endif

.if defined(WITHOUT_PIC)
CONFIGURE_ARGS+=	--disable-pic14-port
PLIST_SUB+=		PIC14="@comment "
.else
BUILD_DEPENDS+=		gpasm:${PORTSDIR}/devel/gputils
PLIST_SUB+=		PIC14=""
.endif

.if defined(WITHOUT_PIC16)
CONFIGURE_ARGS+=	--disable-pic16-port
PLIST_SUB+=		PIC16="@comment "
.else
BUILD_DEPENDS+=		gpasm:${PORTSDIR}/devel/gputils
PLIST_SUB+=		PIC16=""
.endif

.if defined(WITHOUT_XA51)
PLIST_SUB+=		XA51="@comment "
.else
CONFIGURE_ARGS+=	--enable-xa51-port --enable-xa
PLIST_SUB+=		XA51=""
.endif

.if defined(WITHOUT_HC08)
CONFIGURE_ARGS+=	--disable-hc08-port --disable-hc08
PLIST_SUB+=		HC08="@comment "
.else
PLIST_SUB+=		HC08=""
.endif

.if defined(WITHOUT_DEVLIB)
CONFIGURE_ARGS+=	--disable-device-lib
PLIST_SUB+=		DEVLIB="@comment "
.else
PLIST_SUB+=		DEVLIB=""
.endif

.if defined(WITHOUT_UCSIM)
CONFIGURE_ARGS+=	--disable-ucsim
PLIST_SUB+=		UCSIM="@comment "
.else
USE_AUTOTOOLS+=		libtool
LIBTOOLFILES=		sim/ucsim/configure
PLIST_SUB+=		UCSIM=""
.endif

.if defined(WITHOUT_PACKIHX)
CONFIGURE_ARGS+=	--disable-packihx
PLIST_SUB+=		PACKIHX="@comment "
.else
PLIST_SUB+=		PACKIHX=""
.endif

post-patch:
	@${REINPLACE_CMD} 's,ARCH,PICARCH,g' \
		${WRKSRC}/device/lib/pic14/Makefile.common.in \
		${WRKSRC}/device/lib/pic14/Makefile.rules \
		${WRKSRC}/device/lib/pic16/configure
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} 's, [a-z-]*doc,,' \
		${WRKSRC}/Makefile.in \
		${WRKSRC}/sim/ucsim/packages_in.mk
.endif

.include <bsd.port.post.mk>
