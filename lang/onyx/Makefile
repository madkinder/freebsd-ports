# New ports collection Makefile for:	onyx
# Date created:		15 May 2001
# Whom:			jasone
#
# $FreeBSD$
#

PORTNAME=	onyx
PORTVERSION=	5.1.2
CATEGORIES=	lang
MASTER_SITES=	http://www.canonware.com/download/onyx/

MAINTAINER=	jasone@FreeBSD.org
COMMENT=	Embeddable stack-based threaded interpreted language

BUILD_DEPENDS=	cook:${PORTSDIR}/devel/cook
LIB_DEPENDS=	edit.6:${PORTSDIR}/devel/libedit \
		pcre.0:${PORTSDIR}/devel/pcre

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libedit-prefix=${LOCALBASE} \
		--with-pcre-prefix=${LOCALBASE}
USE_LDCONFIG=	yes

MAN1=		onyx.1 onyx_config.1

PLIST_SUB=	ONYX_VERSION=${PORTVERSION}

.include <bsd.port.pre.mk>

.if ${ARCH} == "ia64"
BROKEN=		Coredump during build on ia64
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure

do-build:
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} cook)

do-install:
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} cook install)

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/onyx
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
