# New ports collection makefile for:	xfburn
# Date created:		2008 November 06
# Whom:			J.R. Oldroyd <fbsd@opal.com>
#
# $FreeBSD$
#

PORTNAME=	xfburn
PORTVERSION=	0.4.3
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_XFCE}
MASTER_SITE_SUBDIR=/src/apps/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	xfce4

MAINTAINER=	shuvaev@physik.uni-wuerzburg.de
COMMENT=	CD/DVD burning tool for Xfce

LIB_DEPENDS=	burn.4:${PORTSDIR}/devel/libburn \
		isofs.6:${PORTSDIR}/devel/libisofs
RUN_DEPENDS=	cdrdao:${PORTSDIR}/sysutils/cdrdao

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	GMSGFMT=${PREFIX}/bin/msgfmt DATADIRNAME=share

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	intltool pkgconfig
USE_XFCE=	configenv libexo libgui
USE_CDRTOOLS=	yes
INSTALLS_ICONS=	yes

MAN1=		xfburn.1

OPTIONS =	DBUS		"Enable dbus support"	on\
		HAL		"Enable hal support"	on\
		GSTREAMER	"Enable gstreamer for audio support"	off

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
.else
CONFIGURE_ARGS+=	--disable-nls
.endif

.if defined(WITH_DBUS)
LIB_DEPENDS+=	dbus-1.3:${PORTSDIR}/devel/dbus
.else
CONFIGURE_ARGS+=	--disable-dbus
.endif

.if defined(WITH_HAL)
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
.else
CONFIGURE_ARGS+=	--disable-hal
.endif

.if defined(WITH_GSTREAMER)
USE_GSTREAMER=	core
CONFIGURE_ARGS+=	"LDFLAGS=-lgstpbutils-0.10"
.else
CONFIGURE_ARGS+=	--disable-gstreamer
.endif

.include <bsd.port.post.mk>
