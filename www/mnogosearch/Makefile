# New ports collection makefile for:    mnogosearch
# Date created:         27.01.2001
# Whom:                 ache
#
# $FreeBSD$
#

PORTNAME=	mnogosearch
PORTVERSION=	3.3.11
CATEGORIES=	www databases
MASTER_SITES=	http://www.mnogosearch.org/Download/ \
		http://www.bayofrum.net/dist/${PORTNAME}/

MAINTAINER=	crees@FreeBSD.org
COMMENT=	Full featured SQL-based hypertext search engine

MAN1=		indexer.1
MAN5=		indexer.conf.5

OPTIONS=	THREADS "Enable pthreads"		on  \
		SSL     "Enable SSL"			on  \
		ASIAN   "Enable asian charsets"	off \
		SYSLOG  "Send logs to syslog"   on  \
		PGSQL   "Use PGSQL"				off \
		MSQL    "Use MSQL"				off \
		MYSQL   "Use MySQL"				off \
		SQLITE  "Use SQLite 2.x"		off \
		SQLITE3 "Use SQLite 3.x"		on

USE_LDCONFIG=	yes
USE_GNOME=	lthack
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS+=--enable-shared \
		--sysconfdir=${ETCDIR} \
		--localstatedir=/var/mnogosearch \
		--datadir=${DATADIR}
CONFIGURE_ENV+=	LOCALBASE="${LOCALBASE}"
MAKE_ENV+=	MKDIRPROG="${MKDIR}"

PLIST_SUB+=	SHLIB_VER=${SHLIB_VER}
SHLIB_VER=	1

SUB_FILES+=	pkg-message

.include <bsd.port.options.mk>

.if defined(WITH_SSL)
USE_OPENSSL=	yes
.endif

.ifdef WITHOUT_THREADS
CONFIGURE_ARGS+=	--disable-pthreads
CFLAGS+=	-DCONSOLE
.else
CONFIGURE_ARGS+=	--enable-pthreads
CFLAGS+=	${PTHREAD_CFLAGS}
CONFIGURE_ENV+=	LIBS="${PTHREAD_LIBS}"
.endif

.if !defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
.endif

.ifdef WITH_ASIAN
CONFIGURE_ARGS+=	--with-extra-charsets=all
.endif

.ifdef WITHOUT_SYSLOG
CONFIGURE_ARGS+=	--disable-syslog
.endif

.ifdef WITH_PGSQL
USE_PGSQL=		yes
CONFIGURE_ARGS+=	--with-pgsql=${LOCALBASE}
.endif

.ifdef WITH_MSQL
LIB_DEPENDS+=		msql.1:${PORTSDIR}/databases/msql
CONFIGURE_ARGS+=	--with-msql=${LOCALBASE}
.endif

.ifdef WITH_MYSQL
USE_MYSQL=	yes
CONFIGURE_ARGS+=	--with-mysql=${LOCALBASE}
.endif

.ifdef WITH_SQLITE
USE_SQLITE=	2
CONFIGURE_ARGS+=	--with-sqlite=${LOCALBASE}
.endif

.ifndef WITHOUT_SQLITE3
USE_SQLITE=	3
CONFIGURE_ARGS+=	--with-sqlite3=${LOCALBASE}
.endif

.if defined(WITHOUT_SQLITE) && !defined(WITH_MYSQL) && \
    !defined(WITH_MSQL) && !defined(WITH_PGSQL) && !defined(WITH_SQLITE3)
IGNORE=	needs at least one database driver
.endif

DOCS=		ChangeLog INSTALL
PORTDOCS=	*
PORTEXAMPLES=	README *.conf

post-patch:
.if !defined (NOPORTDOCS)
	@${REINPLACE_CMD} -e 's#$$(DESTDIR)$$(prefix)/doc#${DOCSDIR}#' \
		${WRKSRC}/Makefile.in ${WRKSRC}/doc/Makefile.in
.else
	@${REINPLACE_CMD} -e \
		's#^SUBDIRS = include src doc#SUBDIRS = include src#' \
		${WRKSRC}/Makefile.in
.endif

pre-install-su:
	@${MKDIR} ${DATADIR}/

post-install:
	${LN} -sf libmnogosearch.so \
		${PREFIX}/lib/libmnogosearch-${PORTVERSION:R}.so.${SHLIB_VER}
	${CHOWN} -R ${WWWOWN}:${WWWGRP} /var/mnogosearch
.if !defined (NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/
.    for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.    endfor
.endif
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/samples/* ${EXAMPLESDIR}/
.endif
	@${ECHO}
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
