# New ports collection makefile for:   cactid
# Date created:        Feb 26 2005
# Whom:                clement@FreeBSD.org
#
# $FreeBSD$
#

PORTNAME=	spine
PORTVERSION=	0.8.7.g
PORTREVISION=	3
CATEGORIES=	net-mgmt
MASTER_SITES=	http://www.cacti.net/downloads/${PORTNAME}/
DISTNAME=	cacti-${PORTNAME}-0.8.7g

# Vendor's patches
PATCH_SITES=	http://www.cacti.net/downloads/spine/patches/0.8.7g/
PATCHFILES= 	unified_issues.patch
PATCH_DIST_STRIP=-p1

MAINTAINER=	skreuzer@FreeBSD.org
COMMENT=	A multithreaded poller for Cacti written in C

LIB_DEPENDS=	netsnmp.30:${PORTSDIR}/net-mgmt/net-snmp

GNU_CONFIGURE=	YES
CONFIGURE_ARGS+=--with-mysql=${LOCALBASE} --with-snmp=${LOCALBASE}
CPPFLAGS+=	`net-snmp-config --cflags`
LDFLAGS+=	`net-snmp-config --libs`
USE_MYSQL=	YES
USE_OPENSSL=	YES
USE_AUTOTOOLS=	libtool

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 800040
LDFLAGS+=	-fstack-protector
.endif

post-patch:
	@${REINPLACE_CMD} 's,#define\ *DEFAULT_CONF_FILE .*,#define DEFAULT_CONF_FILE "${PREFIX}/etc/spine.conf",' ${WRKSRC}/spine.h

pre-configure:
	@(cd ${WRKSRC} ; ${LIBTOOLIZE} --copy --force --install)

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/spine ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/spine.conf.dist ${EXAMPLESDIR}/spine.conf
	@[ -e ${PREFIX}/etc/spine.conf ] || \
		${INSTALL_DATA} ${EXAMPLESDIR}/spine.conf ${PREFIX}/etc/spine.conf

.include <bsd.port.post.mk>
