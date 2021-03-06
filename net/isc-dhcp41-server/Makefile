# Ports collection makefile for:    isc-dhcp41-server
# Date created:         28 March 2010
# Whom:                 Wesley Shields <wxs@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	dhcp
DISTVERSION=	4.1-ESV
PORTREVISION=	${DHCP_PORTREVISION}
PORTEPOCH=	2
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_ISC}
MASTER_SITE_SUBDIR=	dhcp
PKGNAMEPREFIX=	isc-
PKGNAMESUFFIX=	41-${SUBSYS}
DISTFILES=	${PORTNAME}-${DISTVERSION}-${PATCHLEVEL}${EXTRACT_SUFX}

MAINTAINER=	douglas@douglasthrift.net
COMMENT?=	The ISC Dynamic Host Configuration Protocol server

LICENSE=	ISCL

PATCHLEVEL=	R3
PORTREVISION_SERVER=	2
PORTREVISION_CLIENT=	0
PORTREVISION_RELAY=	2

SUBSYS?=	server
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}-${PATCHLEVEL}

UNIQUENAME=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}

OPTIONS=	DHCP_IPV6 "Enable support for IPv6" on

.if ${SUBSYS} == server
OPTIONS+=	DHCP_PARANOIA "Enable support for chroot" on \
		DHCP_LDAP "Experimental LDAP backend support" off \
		DHCP_LDAP_SSL "Support LDAP connection over SSL/TLS" on
.endif

# PORTREVISION and CONFLICTS handling
.if ${SUBSYS} == client
CONFLICTS=	isc-dhcp3?-client* isc-dhcp4[2-9]-client*
DHCP_PORTREVISION=	${PORTREVISION_CLIENT}
.elif ${SUBSYS} == relay
CONFLICTS=	isc-dhcp3?-relay* isc-dhcp4[2-9]-relay*
DHCP_PORTREVISION=	${PORTREVISION_RELAY}
.else
CONFLICTS=	isc-dhcp3?-server* isc-dhcp4[2-9]-server*
DHCP_PORTREVISION=	${PORTREVISION_SERVER}
.endif

.if ${SUBSYS} == server
USERS=		dhcpd
GROUPS=		dhcpd
.endif

MAN_COMPRESSED=	no
GNU_CONFIGURE=	yes
CPPFLAGS+=	-D_PATH_DHCLIENT_SCRIPT='\"${PREFIX}/sbin/dhclient-script\"' -D_PATH_DHCLIENT_CONF='\"${PREFIX}/etc/dhclient.conf\"' -D_PATH_DHCPD_CONF='\"${PREFIX}/etc/dhcpd.conf\"'
SCRIPTS_ENV+=	PKG_PREFIX=${PREFIX}

.include <bsd.port.options.mk>

.if ${SUBSYS} == client
MAN5+=		dhclient.conf.5 dhclient.leases.5
MAN8+=		dhclient.8 dhclient-script.8
CONF_FILE=	dhclient.conf
.elif ${SUBSYS} == server
CONFIGURE_ARGS+=	--localstatedir=/var
MAN5+=		dhcpd.conf.5 dhcpd.leases.5 dhcp-eval.5 dhcp-options.5
MAN8+=		dhcpd.8
MAN1=		omshell.1
MAN3=		dhcpctl.3 omapi.3
CFLAGS+=	-fPIC
CONF_FILE=	dhcpd.conf
.if defined(WITH_DHCP_IPV6)
CONF_FILE+=	dhcpd6.conf
.endif
.else
MAN8+=		dhcrelay.8
.endif

DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist

.if ${SUBSYS} == server
USE_RC_SUBR=	isc-dhcpd
.elif ${SUBSYS} == relay
USE_RC_SUBR=	isc-dhcrelay
.endif

SCHEMA_DIR=	${PREFIX}/share/${PKGBASE}
DOCSDIR=	${PREFIX}/share/doc/${PKGBASE}
DATADIR=	/var/db

MSG_FILE=	${.CURDIR}/pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

REINPLACE_SUB=	PREFIX="${PREFIX}"
PKGMESSAGE_SUB=	PREFIX="${PREFIX}" MAN1PREFIX="${MAN1PREFIX}" \
		DOCSDIR="${DOCSDIR}"

# XXX: Have to hardcode 4.1.1 here as there is no release for 4.1.2 or later.
.if defined(WITH_DHCP_LDAP)
MASTER_SITES+=		http://cloud.github.com/downloads/dcantrell/ldap-for-dhcp/:ldap
LDAPPATCHRELEASE=	2
LDAPPATCHDIST=		ldap-for-dhcp-4.1.1-${LDAPPATCHRELEASE}
LDAPPATCHFILE=		dhcp-4.1.1-ldap.patch
DISTFILES+=		${LDAPPATCHDIST}.tar.gz:ldap
PLIST_SUB+=		SCHEMA_DIR="${SCHEMA_DIR:S,^${PREFIX}/,,}" LDAP=""
PORTDOCS+=		README.ldap LICENSE.ldap
LDAP_SCRIPT=		${WRKDIR}/${LDAPPATCHDIST}/dhcpd-conf-to-ldap
LDAP_SCHEMA=		${WRKDIR}/${LDAPPATCHDIST}/dhcp.schema
USE_PERL5_RUN=		yes
USE_OPENLDAP=		yes
USE_AUTOTOOLS=		aclocal libtoolize autoconf autoheader automake
LIBTOOLIZE_ARG=		--copy --force
AUTOMAKE_ARGS=		--foreign --add-missing --copy
CFLAGS+=		-I${PREFIX}/include -L${PREFIX}/lib
CONFIGURE_ARGS+=	--with-ldap
.else
PLIST_SUB+=	LDAP="@comment "
.endif

# WITH_DHCP_LDAP_SSL without WITH_DHCP_LDAP is silly.
.if defined(WITH_DHCP_LDAP_SSL) && defined (WITH_DHCP_LDAP)
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-ldapcrypto
CONFIGURE_ENV+=	LIBS="-lssl"
# hack to get bsd.openssl.mk included at this late state
.include "${PORTSDIR}/Mk/bsd.openssl.mk"
.endif

.if defined(WITH_DHCP_PARANOIA)
CONFIGURE_ARGS+=	--enable-paranoia --enable-early-chroot
SUB_LIST+=	PARANOIA=yes
.else
SUB_LIST+=	PARANOIA=no
.endif

.if defined(WITH_DHCP_IPV6)
CONFIGURE_ARGS+=	--enable-dhcpv6
PLIST_SUB+=		IPV6=""
.else
CONFIGURE_ARGS+=	--disable-dhcpv6
PLIST_SUB+=		IPV6="@comment "
.endif

pre-patch:
.if ${SUBSYS} == server && defined(WITH_DHCP_LDAP)
	@${PATCH} ${WRKDIR}/${LDAPPATCHDIST}/${LDAPPATCHFILE} ${FILESDIR}/extra-patch-${LDAPPATCHFILE}
	@cd ${WRKSRC} && ${PATCH} -p1 < ${WRKDIR}/${LDAPPATCHDIST}/${LDAPPATCHFILE}
.endif

post-patch:
	@${SED} ${PKGMESSAGE_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${MSG_FILE} > ${PKGMESSAGE}
	@${REINPLACE_CMD} ${REINPLACE_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/client/dhclient.conf

do-install:
	${MAKE} -C ${WRKSRC}/${SUBSYS} install
.if ${SUBSYS} == server
	${MAKE} -C ${WRKSRC}/dhcpctl install
	${MAKE} -C ${WRKSRC}/dst install
	${MAKE} -C ${WRKSRC}/omapip install
	${MAKE} -C ${WRKSRC}/includes install
	${MAKE} -C ${WRKSRC}/common install
	${INSTALL_DATA} ${WRKSRC}/dhcpctl/dhcpctl.h ${PREFIX}/include
.if defined(WITH_DHCP_IPV6)
	${INSTALL_DATA} ${WRKSRC}/doc/examples/dhcpd-dhcpv6.conf \
		${PREFIX}/etc/dhcpd6.conf.sample
.endif
.endif
.if defined(WITH_DHCP_LDAP)
	@${MKDIR} ${SCHEMA_DIR}
	${INSTALL_DATA} ${LDAP_SCHEMA} ${SCHEMA_DIR}
	${INSTALL_SCRIPT} ${LDAP_SCRIPT} ${PREFIX}/bin
.endif
.if defined(WITH_DHCP_LDAP) && !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKDIR}/${LDAPPATCHDIST}/README.ldap   ${DOCSDIR}
	${INSTALL_MAN} ${WRKDIR}/${LDAPPATCHDIST}/LICENSE.ldap  ${DOCSDIR}
.endif

post-install:
.if defined(CONF_FILE)
.for FILE in ${CONF_FILE}
	if [ ! -f ${PREFIX}/etc/${FILE} ]; then \
		${CP} -p ${PREFIX}/etc/${FILE}.sample ${PREFIX}/etc/${FILE} ; \
	fi
.endfor
.endif
.if ${SUBSYS} == client
	${INSTALL_SCRIPT} ${WRKSRC}/client/scripts/freebsd ${PREFIX}/sbin/dhclient-script
.elif ${SUBSYS} == server
.if defined(WITH_DHCP_IPV6)
	@${LN} -sf isc-dhcpd ${PREFIX}/etc/rc.d/isc-dhcpd6
.endif
.elif ${SUBSYS} == relay
.if defined(WITH_DHCP_IPV6)
	@${LN} -sf isc-dhcrelay ${PREFIX}/etc/rc.d/isc-dhcrelay6
.endif
.endif
	@${SED} ${PKGMESSAGE_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${MSG_FILE} > ${PKGMESSAGE}
.if defined(WITH_DHCP_LDAP)
	@${REINPLACE_CMD} -e 's|^%%LDAP%%||g' ${PKGMESSAGE}
.else
	@${REINPLACE_CMD} -e '/^%%LDAP%%/d' ${PKGMESSAGE}
.endif
	@${ECHO_MSG}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_MSG}

.include <bsd.port.mk>
