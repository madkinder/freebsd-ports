# New ports collection makefile for:   uim-qt
# Date created:        31 August 2003
# Whom:                MANTANI Nobutaka <nobutaka@FreeBSD.org>
#
# $FreeBSD$
#

PKGNAMESUFFIX=	-qt

COMMENT=	QT modules of uim input method

USE_QT_VER=	3
USE_AUTOTOOLS=	libtool

LIB_DEPENDS=	uim.8:${PORTSDIR}/textproc/uim

MASTERDIR=	${.CURDIR}/../../textproc/uim
PKGDIR=		${.CURDIR}
CONFIGURE_ARGS=	--with-qt --enable-pref --enable-default-toolkit=qt \
		--disable-kde-applet
CONFIGURE_ENV=	QTDIR=${LOCALBASE}/lib QTINCDIR=${LOCALBASE}/include \
		LIBS="${LIBS} ${PTHREAD_LIBS} -L${LOCALBASE}/lib"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	${PTHREAD_LIBS} -L${LOCALBASE}/lib
CXXFLAGS+=	${PTHREAD_CFLAGS} -I${LOCALBASE}/include
UIM_SLAVE=	yes

EXTRA_PATCHES=	${PATCHDIR}/extra-patch-qt_Makefile.in \
		${PATCHDIR}/extra-patch-qt_chardict_po_Makefile.in.in

.if defined(WITHOUT_X11)
IGNORE=		requires X11
.endif

do-build:
	(cd ${WRKSRC}/uim && ${SETENV} ${MAKE_ENV} ${GMAKE} libuim-counted-init.la)
	(cd ${WRKSRC}/qt && ${SETENV} ${MAKE_ENV} ${GMAKE})

do-install:
	(cd ${WRKSRC}/qt && ${SETENV} ${MAKE_ENV} ${GMAKE} install)

.include "${MASTERDIR}/Makefile"
