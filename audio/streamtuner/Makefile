# New ports collection makefile for:	streamtuner
# Date created:			02 Apr 2002
# Whom:				Jean-Yves Lefort <jylefort@brutele.be>
#
# $FreeBSD$
#

PORTNAME=		streamtuner
PORTVERSION=		0.99.99
PORTREVISION=	18
CATEGORIES=		audio www
MASTER_SITES=		${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=		ports@FreeBSD.org
COMMENT=		A GTK+ stream directory browser

BUILD_DEPENDS=		rarian-sk-config:${PORTSDIR}/textproc/rarian
LIB_DEPENDS=		curl:${PORTSDIR}/ftp/curl
RUN_DEPENDS=		${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme

USE_GNOME=		gtk20 gnomehack gnomeprefix
USE_GMAKE=		yes
INSTALLS_OMF=		yes
GNU_CONFIGURE=		yes
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

OPTIONS=		SHOUTCAST "SHOUTcast plugin" on \
			LIVE365 "Live365 plugin" on \
			XIPH "Xiph plugin" on \
			LOCAL "Local plugin" on \
			LOCAL_METADATA "metadata support for the Local plugin" on \
			PYTHON "Python plugin" on

.include <bsd.port.pre.mk>

.if defined(WITHOUT_SHOUTCAST)
CONFIGURE_ARGS+=	--disable-shoutcast
PLIST_SUB+=		SHOUTCAST="@comment "
.else
PLIST_SUB+=		SHOUTCAST=""
.endif

.if defined(WITHOUT_LIVE365)
CONFIGURE_ARGS+=	--disable-live365
PLIST_SUB+=		LIVE365="@comment "
.else
PLIST_SUB+=		LIVE365=""
.endif

.if defined(WITHOUT_XIPH)
CONFIGURE_ARGS+=	--disable-xiph
PLIST_SUB+=		XIPH="@comment "
.else
PLIST_SUB+=		XIPH=""
USE_GNOME+=		libxml2
.endif

.if defined(WITHOUT_LOCAL)
CONFIGURE_ARGS+=	--disable-local
PLIST_SUB+=		LOCAL="@comment "
.else
PLIST_SUB+=		LOCAL=""
.if defined(WITHOUT_LOCAL_METADATA)
CONFIGURE_ARGS+=	--disable-local-metadata
.else
LIB_DEPENDS+=		tag_c:${PORTSDIR}/audio/taglib
.endif
.endif

.if defined(WITHOUT_PYTHON)
CONFIGURE_ARGS+=	--disable-python
PLIST_SUB+=		PYTHON="@comment "
.else
PLIST_SUB+=		PYTHON=""
USE_PYTHON=		2.5+
# we need to manually include this, because USE_PYTHON is defined
# after including bsd.port.pre.mk
.include "${PORTSDIR}/Mk/bsd.python.mk"
USE_GNOME+=		pygtk2
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|[(]datadir[)]/help|(datadir)/gnome/help|g' \
		${WRKSRC}/help/C/Makefile.in

.include <bsd.port.post.mk>
