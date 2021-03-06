# New ports collection makefile for:	Window Maker
# Date created:				August 13, 1997
# Whom:					Brian Handy <handy@physics.montana.edu>
#
# $FreeBSD$
#

PORTNAME=	windowmaker
PORTVERSION=	0.92.0
PORTREVISION=	10
CATEGORIES=	x11-wm windowmaker
MASTER_SITES=	${MASTER_SITE_WINDOWMAKER} \
		http://dougbarton.us/Downloads/
MASTER_SITE_SUBDIR=	source/release
DISTNAME=	WindowMaker-${PORTVERSION}

MAINTAINER=	dougb@FreeBSD.org
COMMENT=	GNUstep-compliant NeXTstep window manager clone

LIB_DEPENDS=	ungif.5:${PORTSDIR}/graphics/libungif \
		png.6:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff
RUN_DEPENDS=	${LOCALBASE}/share/WindowMaker/Themes/LeetWM.themed/style:${PORTSDIR}/graphics/wmicons

MAKE_JOBS_SAFE=	yes

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GNOME=	gnomehack pkgconfig
USE_XORG=	xpm xft
USE_PERL5=	yes
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-pixmapdir=${PREFIX}/include/X11/pixmaps \
		--with-nlsdir=${PREFIX}/share/locale \
		--with-libs-from="-L${LOCALBASE}/lib" \
		--with-incs-from="-I${LOCALBASE}/include" \
		--with-gnustepdir="${PREFIX}/GNUstep" \
		--disable-debug
USE_LDCONFIG=	yes

CONFLICTS=	libwraster-0.*

MANLANG=	"" sk
MAN1=		geticonset.1x getstyle.1x seticons.1x setstyle.1x wdwrite.1x \
		wmaker.1x wmsetbg.1x wxcopy.1x wxpaste.1x

PORTDOCS=	AUTHORS BUGFORM BUGS ChangeLog FAQ INSTALL NEWS README \
		README.definable-cursor TODO

OPTIONS=	WM_SINGLE_CLICK "Add single-click option to WPrefs menu" on \
		XINERAMA "Enable xinerama support" off \
		XKB_STATUS "XKB keyboard language status support" off \
		WM_LINGUAS "Enable support for additional locales" off \
		DOCKHOTKEYS "Enable support for hotkeys on docks" off

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ENV+=	ac_cv_c_inline_asm=no
.endif

.if defined(WITH_XINERAMA) || defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=	--enable-xinerama
.endif

.if defined(WITH_XKB_STATUS) || defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=	--enable-modelock
.endif

.if !defined(WITHOUT_WM_SINGLE_CLICK) || defined(PACKAGE_BUILDING)
EXTRA_PATCHES+=		${WRKSRC}/contrib/single_click.diff
.endif

.if defined(WITH_WM_LINGUAS) || defined(PACKAGE_BUILDING)
LINGUAS!=	${CAT} ${FILESDIR}/LINGUAS
CONFIGURE_ENV+=	LINGUAS="${LINGUAS}"
PLIST_SUB=	WM_LINGUAS=""
.else
PLIST_SUB=	WM_LINGUAS="@comment "
.endif

.if defined(WITH_DOCKHOTKEYS)
EXTRA_PATCHES+=	${FILESDIR}/extra_dockhotkeys.patch
.endif

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/WPrefs.app/Paths.c
	@${REINPLACE_CMD} -e "s|%%PERL%%|${PERL}|g" ${WRKSRC}/util/wm-oldmenu2new
	@${REINPLACE_CMD} -e "s|Trebuchet MS,Luxi Sans|sans|g" ${WRKSRC}/WindowMaker/Defaults/WMGLOBAL
	@${REINPLACE_CMD} -e "s|/usr/local/GNUstep|${PREFIX}/GNUstep|g" \
		${WRKSRC}/WindowMaker/*menu*
	@(for file in `grep -rl windowmaker\.org ${WRKSRC}`; do \
	${REINPLACE_CMD} -e "s|windowmaker\.org|windowmaker\.info|g" $$file; \
	done)

post-install:
	@${MKDIR} ${PREFIX}/share/WindowMaker/Sounds
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

update-LINGUAS: extract
	cd ${WRKSRC}/po && \
		${ECHO_CMD} *.po | ${SED} 's|\.po||g' > ${FILESDIR}/LINGUAS

.include <bsd.port.post.mk>
