# New ports collection makefile for:	xpdf
# Date created:         02 Feb 1996
# Whom:                 chuckr@glue.umd.edu
#
# $FreeBSD$
#

PORTNAME=	xpdf
PORTVERSION=	3.02
PORTREVISION=	16
CATEGORIES=	graphics print
MASTER_SITES=	ftp://ftp.foolabs.com/pub/xpdf/ \
		${MASTER_SITE_TEX_CTAN}
MASTER_SITE_SUBDIR=	support/xpdf

PATCH_SITES=	ftp://ftp.foolabs.com/pub/xpdf/
PATCHFILES=	xpdf-3.02pl1.patch xpdf-3.02pl2.patch xpdf-3.02pl3.patch \
		xpdf-3.02pl4.patch xpdf-3.02pl5.patch
PATCH_DIST_STRIP=	-p1

MAINTAINER=	araujo@FreeBSD.org
COMMENT=	Display PDF files, and convert them to other formats

BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2
LIB_DEPENDS=	t1.5:${PORTSDIR}/devel/t1lib \
		freetype.9:${PORTSDIR}/print/freetype2
RUN_DEPENDS=	${LOCALBASE}/share/ghostscript/fonts/n021003l.pfb:${PORTSDIR}/print/gsfonts

CONFLICTS=	poppler-utils-0.*

USE_GMAKE=	yes
USE_AUTOTOOLS=	autoconf
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--enable-opi \
		--with-t1-library="${LOCALBASE}/lib" \
		--with-t1-includes="${LOCALBASE}/include" \
		--with-freetype2-library="${LOCALBASE}/lib" \
		--with-freetype2-includes="${LOCALBASE}/include/freetype2"

OPTIONS=	LIBPAPER "Enable libpaper"      off     \
		DRAW    "Enable drawing annotations" on \
		X11     "Enable X11 support"    on      \

.include <bsd.port.pre.mk>

.if defined(WITH_LIBPAPER)
LIB_DEPENDS+=	paper.2:${PORTSDIR}/print/libpaper
CONFIGURE_ARGS+=--with-libpaper-library="${LOCALBASE}/lib" \
		--with-libpaper-includes="${LOCALBASE}/include"
.else
CONFIGURE_ARGS+=--without-libpaper-library
.endif

.if defined(A4)
CONFIGURE_ARGS+=	--enable-a4-paper
.endif

MAN1=		pdffonts.1 \
		pdfimages.1 \
		pdfinfo.1 \
		pdftoppm.1 \
		pdftops.1 \
		pdftotext.1
MAN5=		xpdfrc.5

CONFLICTS=	poppler-utils-[0-9]*

.if defined(WITHOUT_X11)
PKGNAMESUFFIX+=		-nox11
CONFIGURE_ARGS+=	--without-x
PLIST_SUB+=		X11="@comment "
.else
CONFIGURE_ARGS+=	--with-x
USE_MOTIF=		yes
MAN1+=			xpdf.1
PLIST_SUB+=		X11=""
.endif

.if defined(WITH_DRAW)
# add support for adding/deleting drawing annotations in PDF files
PATCH_SITES+=   http://info.iet.unipi.it/~luigi/FreeBSD/
PATCHFILES+=    patch-zz-xpdf-annot.20080728a

post-patch:
	${REINPLACE_CMD} -e 's|undef USE_COMBO_BOX|define USE_COMBO_BOX 1|' \
		${WRKSRC}/xpdf/XPDFViewer.h
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ANNOUNCE CHANGES INSTALL README misc/hello.pdf
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
