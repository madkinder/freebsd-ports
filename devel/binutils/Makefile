# New ports collection makefile for:	binutils
# Date created:		9 July 2009
# Whom:			Martin Matuska <mm@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	binutils
PORTVERSION=	2.22
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEWARE}
MASTER_SITE_SUBDIR=	binutils/releases

MAINTAINER=	mm@FreeBSD.org
COMMENT=	GNU binary tools

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

BUILD_DEPENDS=	${LOCALBASE}/lib/libgmp.so:${PORTSDIR}/math/gmp \
		${LOCALBASE}/lib/libmpfr.so:${PORTSDIR}/math/mpfr

CONFLICTS=	libbfd-[0-9]*

OPTIONS=	NLS "Enable National Language Support" off

LICENSE=	GPLv3 LGPL3
LICENSE_COMB=	multi
LICENSE_FILE_GPLv3=	${WRKSRC}/COPYING3
LICENSE_FILE_LGPL3=	${WRKSRC}/COPYING3.LIB

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS+=	--with-system-zlib \
			--disable-werror \
			--with-gmp=${LOCALBASE} \
			--with-mpfr=${LOCALBASE}

MAN1=		addr2line.1 \
		ar.1 \
		as.1 \
		c++filt.1 \
		gprof.1 \
		dlltool.1 \
		elfedit.1 \
		ld.1 \
		nlmconv.1 \
		nm.1 \
		objcopy.1 \
		objdump.1 \
		ranlib.1 \
		readelf.1 \
		size.1 \
		strings.1 \
		strip.1 \
		windmc.1 \
		windres.1

INFO=		as \
		binutils \
		standards \
		gprof \
		bfd \
		configure \
		ld

.include <bsd.port.pre.mk>

.if defined(WITH_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ${ARCH} == "amd64"
ARCH=		x86_64
.endif

post-install:
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} ! -type d | \
		${SED} -e 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} -ds ${PREFIX}/${CONFIGURE_TARGET} -type d | \
		${SED} -e 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}

.include <bsd.port.post.mk>
