# New ports collection makefile for:	mp
# Date created:			Apr 12, 2001
# Whom:				Mark Pulford <mark@kyne.com.au>
#
# $FreeBSD$
#

PORTNAME=	mp
PORTVERSION=	5.2.1
CATEGORIES=	editors
MASTER_SITES=	http://triptico.com/download/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A programming text editor

LICENSE=	GPLv2 # (or later)
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS=	NLS	"Native language support"	on \
		GTK2	"Build with GTK2 support"	off \
		QT4	"Build with QT4 support"	off \
		PCRE	"Build with PCRE support"	on

WANT_GNOME=	yes
USE_ICONV=	yes
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	config.sh
CONFIGURE_ARGS=	--prefix=${PREFIX} --without-win32 --without-kde4

MAN1=		mp-5.1

DATADIR=	${PREFIX}/share/mp-5

.include <bsd.port.options.mk>

.if defined(WITH_GTK2) && defined(WITH_QT4)
IGNORE=	GTK2 and QT4 GUIs are mutually exclusive. Please rerun 'make config' and disable one of these
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--without-gettext
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

.if defined(WITH_GTK2)
USE_GNOME+=	gtk20
.else
CONFIGURE_ARGS+=	--without-gtk
.endif

.if defined(WITH_QT4)
USE_QT_VER+=	4
QT_COMPONENTS=	corelib gui moc_build
QT_NONSTANDARD=	yes
CONFIGURE_ENV+=	CPP="${CXX}" CCLINK="${CXX}"
.else
CONFIGURE_ARGS+=	--without-qt4
.endif

.if !defined(WITHOUT_PCRE)
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
CONFIGURE_ARGS+=	--with-pcre
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|<ncursesw/|<|g ; \
		 s|-I/usr/local/include||g ; \
		 s|-L/usr/local/lib||g ; \
		 s|-lX11||g' ${WRKSRC}/config.sh
	@${REINPLACE_CMD} -e 's|<ncursesw/|<|g' ${WRKSRC}/mpv_curses.c
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/mpdm/config.sh
.for i in mpdm/mpdm.h mpdm/mpdm_s.c mpsl/mpsl_d.c
	@${REINPLACE_CMD} -e 's|<malloc\.h>|<stdlib.h>|g' ${WRKSRC}/${i}
.endfor

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mp-5 ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/mpsl/mpsl ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/mp-5.1 ${MANPREFIX}/man/man1
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/mp_*.mpsl ${DATADIR}
	@${MKDIR} ${DATADIR}/lang
	${INSTALL_DATA} ${WRKSRC}/lang/*.mpsl ${DATADIR}/lang
.if !defined(WITHOUT_NLS)
.for lang in de es it nl ru sv
	@${MKDIR} ${PREFIX}/share/locale/${lang}/LC_MESSAGES
	${INSTALL_DATA} ${WRKSRC}/po/${lang}.mo \
		${PREFIX}/share/locale/${lang}/LC_MESSAGES/minimum-profit.mo
.endfor
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS README RELEASE_NOTES mp_templates.sample doc/*.*
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
