# New ports collection makefile for:	fb303
# Date created:		2009-08-14
# Whom:			Gea-Suan Lin <gslin@gslin.org>
#
# $FreeBSD$
#

PORTNAME=	fb303
PORTVERSION=	20090908
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	bms
DISTNAME=	thrift-${PORTVERSION}

MAINTAINER=	gslin@gslin.org
COMMENT=	The Facebook Bassline

LIB_DEPENDS=	boost_system:${PORTSDIR}/devel/boost-libs \
		thrift:${PORTSDIR}/devel/thrift

BROKEN=		does not compile

ACLOCAL_ARGS=	-I ./aclocal
AUTOMAKE_ARGS=	-a
CONFIGURE_ARGS=	PY_PREFIX="${PREFIX}"
PLIST_SUB+=	PYTHON_VERSION_SHORTNAME="${PYTHON_VERSION_SHORTNAME}"
PYTHON_VERSION_SHORTNAME=	${PYTHON_VERSION:S/thon//}
USE_AUTOTOOLS=	aclocal automake autoconf
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5_RUN=	yes
USE_PYTHON=	yes
WRKSRC=		${WRKDIR}/${DISTNAME}/contrib/fb303

post-build:
	(cd ${WRKSRC} && ${LOCALBASE}/bin/thrift --gen perl ${WRKSRC}/if/fb303.thrift)

post-install:
	${MKDIR} ${PREFIX}/${SITE_PERL_REL}/Facebook/FB303
.for FILE in Constants.pm FacebookService.pm Types.pm
	${INSTALL_DATA} ${WRKSRC}/gen-perl/Facebook/FB303/${FILE} ${PREFIX}/${SITE_PERL_REL}/Facebook/FB303
.endfor

.include <bsd.port.mk>
