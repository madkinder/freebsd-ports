# New ports collection makefile for:	db47
# Date created:		2008-06-23
# Whom:			Gea-Suan Lin <gslin@gslin.org>
#
# $FreeBSD$
#

PORTNAME=	db47
PORTVERSION=	4.7.25.4
CATEGORIES=	databases
MASTER_SITES=	http://download.oracle.com/berkeley-db/ 
PKGNAMEPREFIX?=
DISTNAME=	db-${PORTVERSION:R}
DIST_SUBDIR=	bdb

PATCH_SITES=	http://download.oracle.com/berkeley-db/patches/db/${PORTVERSION:R}/
PATCHFILES=	patch.4.7.25.1 patch.4.7.25.2 patch.4.7.25.3
PATCH_DIST_STRIP=	-d .. --ignore-whitespace
# * patch.4.7.25.1: -----------------------------------------------------------
# # [#16406] Replication clients should be able to open a sequence.
# * patch.4.7.25.2: -----------------------------------------------------------
# # [#16415] DB_ENV->lock_get may self deadlock if user defined locks
#	     are used and there is only one lock partition defined.
# * patch.4.7.25.3: -----------------------------------------------------------
# # [#16541] Fix for dd segfaults.
# * patch.4.7.25.4: -----------------------------------------------------------
# # [#16299] Fix a bug which could cause a SEGV in __repmgr_available_site if a
#            site becomes master after winning an election but is still
#            processing client messages.

# I allow matthias.andree@gmx.de and all freebsd committer to do changes
# to this package.

MAINTAINER=	gslin@gslin.org
COMMENT=	The Berkeley DB package, revision 4.7

BDBVER=		${PORTVERSION:R:R}
CONFIGURE_ARGS=	--enable-compat185 --enable-dump185 --enable-cxx \
		--enable-dynamic --enable-rpc --enable-pthread_api \
		--includedir=${PREFIX}/include/${PORTNAME} \
		--libdir=${PREFIX}/lib/${PORTNAME} \
		--bindir=${PREFIX}/bin/${PORTNAME}
CONFIGURE_SCRIPT=	../dist/configure
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
INSTALL_TARGET=	install_include install_lib install_utilities
LIBTOOLFILES=	${CONFIGURE_SCRIPT}
WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix
USE_LDCONFIG=	yes

.if !defined(NOPORTDOCS)
INSTALL_TARGET+=	install_docs docdir=${DOCSDIR}
PORTDOCS=	*
.endif

pre-configure:
	@${REINPLACE_CMD} -e 's|freebsd1\*)|freebsd1\.\*)|' \
		-e 's|freebsd\[123\]\*)|freebsd\[123\]\.\*)|' \
		${WRKSRC}/${CONFIGURE_SCRIPT}

post-install:
.for i in libdb libdb_cxx
	${LN} -s -f ${PORTNAME}/${i}-${BDBVER}.so.0 ${PREFIX}/lib
	${LN} -s -f ${i}-${BDBVER}.so.0 ${PREFIX}/lib/${i}-${BDBVER}.so
.endfor
	cd ${PREFIX}/bin/${PORTNAME} ; \
	for i in * ; do ${LN} -s -f ${PORTNAME}/$$i ../$$i-${BDBVER} ; done

.include <bsd.port.mk>
