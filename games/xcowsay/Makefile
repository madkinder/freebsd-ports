# New ports collection makefile for:	xcowsay
# Date created:		2008/09/07
# Whom:			chinsan
#
# $FreeBSD$
#

PORTNAME=	xcowsay
PORTVERSION=	1.3
CATEGORIES=	games
MASTER_SITES=	http://www.nickg.me.uk/files/ \
		http://www.predatorlabs.net/dl/

MAINTAINER=	rfarmer@predatorlabs.net
COMMENT=	A graphical configurable talking cow

OPTIONS=	DBUS "Enable DBus support" off

USE_GNOME=	gtk20
USE_GETTEXT=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

MAN6=		xcowsay.6
PLIST_FILES=	bin/xcowdream \
		bin/xcowfortune \
		bin/xcowsay \
		bin/xcowthink \
		share/locale/pt_BR/LC_MESSAGES/xcowsay.mo \
		share/locale/ru/LC_MESSAGES/xcowsay.mo \
		%%DATADIR%%/cow_large.png \
		%%DATADIR%%/cow_med.png \
		%%DATADIR%%/cow_small.png
PLIST_DIRS=	%%DATADIR%%

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.options.mk>

.if defined(WITH_DBUS)
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
CFLAGS+=	-DWITH_DBUS
CONFIGURE_ARGS+=	--enable-dbus
.endif

.include <bsd.port.mk>
