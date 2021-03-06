# New ports collection makefile for:	apache22
# Date created:				Dec 11 2004
# Whom:					Clement Laforet <clement@FreeBSD.org>
#
# $FreeBSD$
#
# For more information, please read Makefile.doc
#

PORTNAME=	apache
PORTVERSION=	2.2.21
#PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_APACHE_HTTPD}
DISTNAME=	httpd-${PORTVERSION}
DIST_SUBDIR=	apache22

MAINTAINER?=	apache@FreeBSD.org
COMMENT?=	Version 2.2.x of Apache web server with ${WITH_MPM:L} MPM.

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2 \
		apr-1:${PORTSDIR}/devel/apr1 \
		pcre.0:${PORTSDIR}/devel/pcre

MAKE_JOBS_SAFE=	yes

LATEST_LINK?=	apache22

CONFLICTS=	apache+mod_ssl-1.* apache+mod_ssl+ipv6-1.* apache+mod_ssl+modsnmp-1.* \
		apache+mod_ssl+mod_snmp+ipv6-1.* apache+mod_ssl+mod_accel-1.* \
		apache+mod_ssl+mod_snmp+mod_accel-1.* \
		apache+ipv6-1.* apache+ssl-1.* apache-1.* apache_fp-1.* \
		caudium-devel-1.* caudium10-1.* caudium12-1.* caudium14-1.* \
		ru-apache+mod_ssl-1.* ru-apache-1.* \
		apache-2.0.* apache-*-2.0.* \
		apache-*-2.2.*

USE_APACHE=		common22
USE_BZIP2=		yes
USE_ICONV=		yes
USE_AUTOTOOLS=		autoconf libtool
USE_PERL5=		yes
USE_RC_SUBR=		apache22 htcacheclean
LIBTOOLFILES=	configure.in

MPM_ITK_VERSION?=	20110321-01

# for slave ports
.if !defined(MASTERDIR)
APACHEDIR=	${.CURDIR}
.else
APACHEDIR=	${MASTERDIR}
.endif

.if !defined(WITHOUT_APACHE_OPTIONS)
OPTIONS=	\
	THREADS 		"Enable threads support in APR" 		Off \
	MYSQL 			"Enable MySQL support for apr-dbd" 		Off \
	PGSQL 			"Enable PostgreSQL support for apr-dbd" Off \
	SQLITE 			"Enable SQLite support for apr-dbd" 	Off \
	IPV6 			"Enable IPv6 support" 					On  \
	BDB 			"Enable BerkeleyDB dbm" 				Off
.include "${APACHEDIR}/Makefile.options"
.endif

.if defined(WITH_SUEXEC_RSRCLIMIT)
EXTRA_PATCHES+= ${FILESDIR}/extra-patch-suexec_rsrclimit
.if !defined(WITH_SUEXEC)
IGNORE=         suEXEC resource limit patch requires mod_suexec.\
		Please (re)run 'make config' and choose SUEXEC option also
.endif
.endif

CONFIGURE_ARGS=	--prefix=${PREFIX_RELDEST} \
		--enable-layout=FreeBSD \
		--with-perl=${PERL5} \
		--with-port=${WITH_HTTP_PORT} \
		--with-expat=${LOCALBASE} \
		--with-iconv=${LOCALBASE} \
		--enable-http \
		--with-pcre=${LOCALBASE} \
		--with-apr=${LOCALBASE}/bin/apr-1-config \
		--with-apr-util=${LOCALBASE}/bin/apu-1-config

CONFIGURE_ENV=	\
		CONFIG_SHELL="${SH}" \
		LOCALBASE="${LOCALBASE}"

PREFIX_RELDEST=	${PREFIX:S,^${DESTDIR},,}

MAKE_ENV+=	EXPR_COMPAT=yes \
		INSTALL_MAN="${INSTALL_MAN}"

WITH_MPM?=	prefork # or worker, event, itk

WITH_HTTP_PORT?=	80

.if defined(WITH_STATIC_SUPPORT)
CONFIGURE_ARGS+=	--enable-static-support
.endif

# debug overrides CFLAGS
.if defined(WITH_DEBUG)
DEBUG_FLAGS?=	-O0 -g -ggdb3
CFLAGS=		${DEBUG_FLAGS}
CONFIGURE_ARGS+=	--enable-maintainer-mode
WITH_EXCEPTION_HOOK=	YES
.endif

.if defined(WITH_EXCEPTION_HOOK)
CONFIGURE_ARGS+=	--enable-exception-hook
.endif

.include "${APACHEDIR}/Makefile.doc"
.include "${APACHEDIR}/Makefile.modules"
.include <bsd.port.pre.mk>

# OPTIONS fixups
.if defined (WITH_AUTHNZ_LDAP)
WITH_LDAP=	yes
.endif

.include "${APACHEDIR}/Makefile.modules"

.if (defined(WITH_SSL)|| !defined(WITHOUT_SSL_MODULES))
.include "${PORTSDIR}/Mk/bsd.openssl.mk"
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
.endif

.if defined (WITH_LDAP) || defined (WITH_LDAP_MODULES)
USE_OPENLDAP=		yes
CONFIGURE_ARGS+=	--enable-ldap=shared --with-ldap --enable-authnz-ldap \
			--with-ldap-lib="${LOCALBASE}/lib" \
			--with-ldap-include="${LOCALBASE}/include"
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.else
CATEGORIES+=		ipv6
.   if defined(WITH_IPV6_V6ONLY) || defined(WITHOUT_V4MAPPED)
CONFIGURE_ARGS+=	--disable-v4-mapped
.   else
CONFIGURE_ARGS+=	--enable-v4-mapped
.   endif
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
.   if ${ARCH} == i386
CONFIGURE_ARGS+=	--enable-nonportable-atomics
.   endif
.endif

.if defined(WITH_AUTH_DIGEST)
WITH_DEVRANDOM=	yes
.endif
.if defined(WITH_DEVRANDOM)
CONFIGURE_ARGS+=	--with-devrandom
.endif

CONFIGURE_ARGS+=	--with-mpm=${WITH_MPM:L}

pre-everything::
	@${ECHO_MSG}	""
	@${ECHO_MSG}	" To enable a module category: WITH_<CATEGORY>_MODULES"
	@${ECHO_MSG}	" To disable a module category: WITHOUT_<CATEGORY>_MODULES"
	@${ECHO_MSG}	""
	@${ECHO_MSG}	" Per default categories are:"
	@${ECHO_MSG}	"  ${DEFAULT_MODULES_CATEGORIES}"
	@${ECHO_MSG}	" Categories available:"
	@${ECHO_MSG}	"  ${ALL_MODULES_CATEGORIES}"
	@${ECHO_MSG}	""
	@${ECHO_MSG}	"  To see all available knobs, type make show-options"
	@${ECHO_MSG}	"  To see all modules in different categories, type make show-categories"
	@${ECHO_MSG}    "  You can check your modules configuration by using make show-modules"
	@${ECHO_MSG}	""

show-options:
	@${SED} -ne 's/^##//p' ${APACHEDIR}/Makefile.doc

post-patch:
	@${RM} -f ${WRKSRC}/docs/docroot/*.bak
	@${REINPLACE_CMD} -e 's," PLATFORM ",FreeBSD,' ${WRKSRC}/server/core.c
	@${INSTALL_DATA} ${WRKSRC}/NOTICE ${WRKSRC}/docs/manual

post-configure:
	@FTPUSERS=`${EGREP} -v '^#' /etc/ftpusers| ${TR} -s "\n" " "` ;\
	${REINPLACE_CMD} -e "s,%%FTPUSERS%%,$${FTPUSERS}," ${WRKSRC}/docs/conf/extra/httpd-userdir.conf
	@${REINPLACE_CMD} -e "s,%%WWWOWN%%,${WWWOWN}," -e  "s,%%WWWGRP%%,${WWWGRP}," ${WRKSRC}/docs/conf/httpd.conf
	@${REINPLACE_CMD} -e "s,%%PREFIX%%,${PREFIX}," ${WRKSRC}/support/envvars-std

pre-install:
	@PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
	@${MKDIR} ${PREFIX}/etc/apache22/envvars.d
	@${MKDIR} ${PREFIX}/etc/apache22/Includes
	@${INSTALL_DATA} ${FILESDIR}/no-accf.conf ${PREFIX}/etc/apache22/Includes
.if defined(WITH_LOG_FORENSIC)
	@${INSTALL_SCRIPT} ${WRKSRC}/support/check_forensic ${PREFIX}/sbin
.endif
.if !defined(NOPORTDOCS)
.for dir in style/lang style/xsl/util style/xsl
	@[ -d ${DOCSDIR}/${dir}/ ] && ${TOUCH} ${DOCSDIR}/${dir}/.keepme
.endfor
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
